% calibrate the color sensor
brick.SetColorMode(2, 2);

% define some variables
robotSpeed = 50;  % the speed at which robot will move around the maze

while true
    % get distance from ultrasonic sensor
    distance = brick.UltrasonicDist(3);

    % get the color from the color sensor
    color = brick.ColorCode(2);
    
    % start moving forward
    moveForward();
    
    % jit = legoev3
    % mycolorsensor = colorsensor(jit)
    % color = readColor(mycolorsensor)
    if color == 4
        % move forward
        moveForward();
    elseif color == 2
        % pickup the passenger
        brick.MoveMotorAngleRel('B', 20, 35);
    elseif color == 3
        % dropoff the passenger
        brick.MoveMotorAngleRel('B', 20, -35);
        brick.MoveMotor('C', -50)
        brick.MoveMotor('A', -50)
    elseif color == 5
        % stop the robot for 1 second and then move forward
        brick.StopAllMotors();
        pause(1);
        moveForward();
    end

    
    % if distance <= stopDisatnce, then stop the robot and decide where to turn
    if distance <= 13.5
        stop();
        turnRight();
        pause(1);
        turnLeft();
        pause(1);
        turnLeft();
        pause(1);
        turnRight();
        pause(1);
    end
end
