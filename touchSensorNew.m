brick.SetColorMode(2, 2);

while true
    disp("Moving forward");
    brick.MoveMotor('C', 50);
    brick.MoveMotor('A', 50);
    reading = brick.TouchPressed(4);
    if reading == 1
        % stop all motors
        brick.StopAllMotors();
        pause(1.5);
        disp("Touched a wall, getting distance from right side");
        distance = brick.UltrasonicDist(3);
        disp("Got distance from right: " + distance);
        if distance > 26
            disp("Stop all motors");
            brick.StopAllMotors();
            pause(1.5);
            disp("Distance > 26, turning right");
            brick.MoveMotor('C', -50);
            brick.MoveMotor('A', 50);
            pause(1.5);
        else
            % turn 180 towards left side
            disp("Stop all motors");
            brick.StopAllMotors();
            pause(1.5);
            disp("turning again 90 left and pause");
            brick.MoveMotor('C', -50);
            brick.MoveMotor('A', 50);
            pause(3);
            distanceLeft = brick.UltrasonicDist(3);
            disp("Got distance from 180 left: " + distance);
            if distanceLeft > 26
                disp("Distance > 26, turning right to neutral position");
                brick.MoveMotor('C', 50);
                brick.MoveMotor('A', -50);
                pause(1.5);
                brick.StopAllMotors();
            else
                disp("Distance < 26, going straight, turning around");
                brick.MoveMotor('C', 50);
                brick.MoveMotor('A', 50);
            end
        end
    else
        distanceRight = brick.UltrasonicDist(3);
        if distanceRight > 26
            disp("Stop all motors");
            brick.StopAllMotors();
            pause(1.5);
            disp("Turn right");
            brick.MoveMotor('C', 50);
            brick.MoveMotor('A', -50);
            pause(1.5);
            brick.StopAllMotors();
        end
    end
end
