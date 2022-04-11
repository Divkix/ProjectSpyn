brick.SetColorMode(2, 2);

while true

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
                % if distance is more than 12 cm and less than 19, move forward
                disp("Moving forward");
                brick.MoveMotor('C', -46);
                brick.MoveMotor('A', -50);
            elseif distanceRight < 14
                % if distance is less than 12 cm, turn left 100 degrees
                pause(.08);
                disp("Turning left");
                  brick.MoveMotor('C', 30);
                  brick.MoveMotor('A', -30);
            elseif distanceRight > 21
                pause(.08);
                % if distance is more than 19 cm, turn right 100 degrees
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