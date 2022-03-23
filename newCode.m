 brick.SetColorMode(2, 2);

 while true
    % calibrate the color sensor
   
    %color = brick.ColorCode(2);
    
    % get distance from ultrasonic sensor
     distance = brick.UltrasonicDist(3);
     disp(distance);
% 
%     % jit = legoev3
%     % mycolorsensor = colorsensor(git)
%     % color = readColor(mycolorsensor)
%     if color == 4
%         % move forward
%         brick.MoveMotor('C', -50);
%          brick.MoveMotor('A', -50);
%     elseif color == 2
%         % pickup the passenger
%         brick.MoveMotorAngleRel('B', 20, -5);
%     elseif color == 3
%         % dropoff the passenger
%         brick.MoveMotorAngleRel('B', 20, 5);
%         brick.MoveMotor('C', 50)
%         brick.MoveMotor('A', 50)
%     elseif color == 5
%         % stop the robot for 1 second and then move forward
%         brick.StopAllMotors();
%         pause(1);
%         %moveFoward
%          brick.MoveMotor('C', -50);
%         brick.MoveMotor('A', -50);
%     end

    
    % if distance == stopDisatnce, then stop the robot and decide where to
    % turn
    if distance <= 24.5
        %stop
        brick.StopAllMotors();
        %pause
        pause(1);
        %turn right
        brick.MoveMotor('C', 50);
        brick.MoveMotor('A', -50);
        %pause
        pause(1.9);
        brick.StopAllMotors();
    else 
        %moveForward
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', -50);
    end
    
    distance = brick.UltrasonicDist(3);
 
     if distance <= 24.5
         %stop
        brick.StopAllMotors();
        %pause
        pause(1);
        %turn left
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', 50);
        %pause
        pause(1.9);
        brick.StopAllMotors();
     else 
         %moveForward
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', -50);
    end
 end
