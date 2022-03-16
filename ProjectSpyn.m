% connect with EV3 Brick
brick = ConnectBrick('JIT');

% calibrate the color sensor
brick.SetColorMode(2, 2);
color = brick.ColorCode(2);

% calibrate the gyro sensor
brick.GyroCalibrate(1);

% define some variables
stopDistance = 13.5;  % stopDistance is the distance after which the robot should not move
canTurnRight = false;  % canTurnRight == true means than robot can turn right, otherwise it cannot
canTurnLeft = false;  % canTurnLeft == true means than robot can turn left, otherwise it cannot
robotSpeed = 50;  % the speed at which robot will move around the maze

while true
    % get distance from ultrasonic sensor
    distance = brick.UltrasonicDist(3);
    
    % start moving forward
    moveForward();
    
    % jit = legoev3
    % mycolorsensor = colorsensor(git)
    % color = readColor(mycolorsensor)
    if color == 4
        % move forward
        moveForward();
    elseif color == 2
        % pickup the passenger
        brick.MoveMotorAngleRel('B', 20, 35, 'Coast');
    elseif color == 3
        % dropoff the passenger
        brick.MoveMotorAngleRel('B', 20, -35, 'Coast');
        brick.MoveMotor('AC', -50)
    elseif color == 5
        % stop the robot for 1 second and then move forward
        brick.StopAllMotors('Coast');
        pause(1);
        moveForward();
    elseif color == 4
        % stop the robot at the end of maze by exiting loop
        stop();
        break;
    end

    
    % if distance == stopDisatnce, then stop the robot and decide where to
    % turn
    if distance == stopDisatnce
        stop();
        turnRight();
        resetRobot();
        turnLeft();
        resetRobot();
    end

    % if robot can turn and move to right, then turn right
    % elseif it cannot move right but can turn and move to left, turn left
    % else turn the robotBackward
    if canTurnRight == true
        turnRight();
        moveForward();
    elseif canTurnLeft == true
        turnLeft();
        moveForward();
    else
        turnBackward()
    end

end

% function for moving the robot forward
function moveForward()
    brick.MoveMotor('C', -robotSpeed);  
    brick.MoveMotor('A', -robotSpeed);
end

% function to move the robot backward
function turnBackward()
    % get angle from gyro sensor
    angle = brick.GyroAngle(1);
    
    % turn right until angle is 180
    brick.MoveMotor('C', robotSpeed);
    brick.MoveMotor('A', -robotSpeed);

    % stop the robot when robot turns to 180 degrees left
    if angle == 180
        stop();
    end
    
    % recalibrate the gyro sensor and set angle to 0
    brick.GyroCalibrate(1);
end

% function for stop the robot
function stop()
    brick.StopAllMotors('Coast');
end

% function to make the robot turn left
function turnLeft()
    % set canTurnRight as global variable
    global canTurnLeft
    
    % turn left
    brick.MoveMotor('C', -robotSpeed);
    brick.MoveMotor('A', robotSpeed);
    
    % get angle from gyro sensor
    angle = brick.GyroAngle(1);

    % stop the robot when robot turns to 90 degrees left
    if angle == 270
        stop();
    end
    
    % get distance
    distance = brick.UltrasonicDist(3);
    
    % if distance at left side is greater than stopDisatnce, then set
    % canTurnLeft to true, else false
    if distance > stopDistance
        canTurnLeft = true;
       else 
        canTurnLeft = false;
    end
end

% function to make the robot turn right
function turnRight()
    % set canTurnRight as global variable
    global canTurnRight
    
    % turn right
    brick.MoveMotor('C', robotSpeed);
    brick.MoveMotor('A', -robotSpeed);
    
    % get angle from gyro sensor
    angle = brick.GyroAngle(1);

    % stop the robot when robot turns to 90 degrees right
    if angle == 90
        stop();
    end
    
    % get distance
    distance = brick.UltrasonicDist(3);
    
    % if distance at left side is greater than stopDisatnce, then set
    % canTurnRight to true, else false
    if distance > stopDistance
        canTurnRight = true;
    else 
        canTurnRight = false;
    end
    
end


% function to reset the direction of robot to zero
function resetRobot()
    % put in a loop to make sure robot gets stabalized
    while true
        % get the angle from sensor
        angle = brick.GyroAngle(1);
        if angle == 0 || angle == 360
            % if angle is 0 or 360, break out of loop
            break;
        elseif angle > 0 && angle < 180
            % turn left if angle is greater than 0 but smaller than 180
            turnLeft();
        elseif angle == 180
            % turn right if gyro angle is 180
            turnRight();
        elseif angle > 180 && angle < 360
            % turn right if angle is greater than 180 but smaller than 360
            turnRight();
        end
    end
end
