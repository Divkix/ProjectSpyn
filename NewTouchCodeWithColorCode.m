brick.SetColorMode(2, 2);

while true
% ADDING COLOR sensor

    % brick.SetColorMode(SensorPort, Mode);
    color = brick.ColorCode(2);
    %git = legoev3
    %mycolorsensor = colorsensor(git)
    %color = readColor(mycolorsensor)
    if color == 4
    %start
        brick.MoveMotor('C', -46);
        brick.MoveMotor('A', -50);
    elseif color == 2
        %pickup
        brick.MoveMotorAngleRel('B', 20, 35, 'Coast');
    elseif color == 3
        %dropoff
        brick.MoveMotorAngleRel('B', 20, -35, 'Coast');
        brick.MoveMotor('C', -50)
    elseif  color == 5
        brick.StopAllMotors('Coast');
        pause(1);
        brick.MoveMotor('C', -46);
        brick.MoveMotor('A', -50);
    end 
    
    % read data from touch sensor
    reading = brick.TouchPressed(4);

    if reading == 0
        disp("Moving forward");
        brick.MoveMotor('C', -46);
        brick.MoveMotor('A', -50);
        
                % get data from ultrasonic sensor
            distanceRight = brick.UltrasonicDist(3);

            % display the distance
            disp("Distance Right: " + distanceRight);

            if distanceRight > 14 && distanceRight < 21
                % if distance is more than 14 cm and less than 21, move forward
                disp("Moving forward");
                brick.MoveMotor('C', -46);
                brick.MoveMotor('A', -50);
                
            elseif distanceRight < 14
                % if distance is less than 14 cm
                pause(.08);
                disp("Turning left");
                  brick.MoveMotor('C', 30);
                  brick.MoveMotor('A', -30);
                 
            elseif distanceRight > 21
                pause(.08);
                % if distance is more than 21 cm
                disp("Turning right");
                  brick.MoveMotor('C', -30);
                  brick.MoveMotor('A', 30);
              
            end
        else
        % stop all motors before turning
        brick.StopAllMotors();
        pause(1);
        disp("Turning left");
        % turn left 90 degrees
        brick.MoveMotor('C', 30);
        brick.MoveMotor('A', -30);
        pause(1);
    end

   
end



