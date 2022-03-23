global key 
InitKeyboard();

while 1 
    pause (0.1);
    switch key
        case 'w'
            disp('w key pressed');
            brick.MoveMotor('C', -50);
            brick.MoveMotor('A', -50);
        case 's'
            disp ('s key pressed');
            brick.MoveMotor('C', 50);
            brick.MoveMotor('A', 50);
        case 'a' 
            disp ('a key pressed');
            brick.MoveMotor('C', -50);
            brick.MoveMotor('A', 50);
        case 'd'
            disp('d key pressed');
            brick.MoveMotor('C', 50);
            brick.MoveMotor('A', -50);
        case 'uparrow'
            brick.MoveMotor('B', -2);
        case 'downarrow'
            brick.MoveMotor('B', 2);
        case 'b'
            brick.StopMotor('C');
            brick.StopMotor('A');
            brick.StopMotor('B');
        case 'q'
            brick.StopMotor('C');
            brick.StopMotor('A');
            brick.StopMotor('B');
            break;
    end
end

CloseKeyboard();
          
