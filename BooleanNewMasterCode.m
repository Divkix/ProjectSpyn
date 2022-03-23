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
        pause(1.5);
        distanceRight = brick.UltrasonicDist(3);
         %turn left to return to neutral position
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', 50);
        %pause
        pause(1.9);
        brick.StopAllMotors();
         %turn left
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', 50);
        %pause
        pause(1.9);
        brick.StopAllMotors();
        pause(1.5);
        distanceLeft = brick.UltrasonicDist(3);
        %turn right to return to neutral position
        brick.MoveMotor('C', 50);
        brick.MoveMotor('A', -50);
        %pause
        pause(1.9);
        brick.StopAllMotors();
        pause(1.5);
        
        %Handle turning
        if distanceRight> 26 && distanceLeft <= 26
            disp('turning right');
           %Turn Right
            brick.MoveMotor('C', 50);
            brick.MoveMotor('A', -50);
            %pause
            pause(1.9);
            brick.StopAllMotors();
            %collect distance again
            distance = brick.UltrasonicDist(3);
            
        elseif distanceRight <= 26 && distanceLeft > 26
             disp('turning left');
            %Turn Left
             brick.MoveMotor('C', -50);
             brick.MoveMotor('A', 50);
             %pause
             pause(1.9);
             brick.StopAllMotors();
             %collect distance again
            distance = brick.UltrasonicDist(3);
            
        elseif distanceRight <= 26 && distanceLeft <= 26
             %dead end, turn 180
             disp('turning around 180');
             %Turn Right
             brick.MoveMotor('C', 50);
              brick.MoveMotor('A', -50);
             %pause
             pause(3.8);
             brick.StopAllMotors();  
             %collect distance again
            distance = brick.UltrasonicDist(3);

        elseif distanceRight > 26 && distanceLeft > 26
            %bias to turn right if both sides are open
            disp('turning right because of bias');
             %Turn Right
             brick.MoveMotor('C', 50);
             brick.MoveMotor('A', -50);
             %pause
             pause(1.9);
             brick.StopAllMotors();
             %collect distance again
            distance = brick.UltrasonicDist(3);

        end
    else
        %move forward
        disp('moving forward');
        brick.MoveMotor('C', -50);
        brick.MoveMotor('A', -50);
        
    end
    

        
end

        