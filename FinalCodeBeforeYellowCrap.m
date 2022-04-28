brick.SetColorMode(2, 2);
global key;
global hasTouchedBlue;
hasTouchedBlue=false;

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
        %pickup, switch to keyboard control
disp('blue detected');
hasTouchedBlue = true;
brick.StopAllMotors();
brick.beep;        
InitKeyboard();

while 1 
    pause (0.1);
    switch key
        case 'w'
            disp('w key pressed');
            brick.MoveMotor('C', -10);
            brick.MoveMotor('A', -10);
        case 's'
            disp ('s key pressed');
            brick.MoveMotor('C', 10;
            brick.MoveMotor('A', 10);
        case 'a' 
            disp ('a key pressed');
            brick.MoveMotor('C', 10);
            brick.MoveMotor('A', -10);
        case 'd'
            disp('d key pressed');
            brick.MoveMotor('C', -10);
            brick.MoveMotor('A', 10);
        case '9'
            disp ('moving motor arm up');
            brick.MoveMotor('B',-5);
        case '0' 
            disp ('moving motor arm down');
            brick.MoveMotor('B',5);
        case 'b'
            brick.StopAllMotors();
        case 'm'
            disp('returning to code control');
            CloseKeyboard();
            break;
    end
end
    elseif color == 3 && hasTouchedBlue == true
        %dropoff, switch to keyboard control
disp('green detected');
brick.StopAllMotors();
brick.beep;        
InitKeyboard();

while 1 
    pause (0.1);
    switch key
        case 'w'
            disp('w key pressed');
            brick.MoveMotor('C', -15);
            brick.MoveMotor('A', -15);
        case 's'
            disp ('s key pressed');
            brick.MoveMotor('C', 15);
            brick.MoveMotor('A', 15);
        case 'a' 
            disp ('a key pressed');
            brick.MoveMotor('C', 15);
            brick.MoveMotor('A', -15);
        case 'd'
            disp('d key pressed');
            brick.MoveMotor('C', -15);
            brick.MoveMotor('A', 15);
        case '9'
            disp ('moving motor arm up');
            brick.MoveMotor('B',-5);
        case '0' 
            disp ('moving motor arm down');
            brick.MoveMotor('B',5);
        case 'b'
            brick.StopAllMotors();
        case 'm'
            disp('returning to code control');
            CloseKeyboard();
            break;
    end
end
       
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
                pause(.15);
                disp("Turning left");
                  brick.MoveMotor('C', 30);
                  brick.MoveMotor('A', -30);
                 
            elseif distanceRight > 21
                pause(.15);
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