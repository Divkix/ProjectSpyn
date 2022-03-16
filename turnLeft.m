% global brick
% global stopDistance
% global canTurnLeft
% global robotSpeed

% turn left
brick.MoveMotorAngleRel('C', -robotSpeed, 520);
brick.MoveMotorAngleRel('A', robotSpeed, 520);

% get distance
distance = brick.UltrasonicDist(3);

% if distance at left side is greater than stopDisatnce, then set
% canTurnLeft to true, else false
if distance > stopDistance
    canTurnLeft = true;
    else 
    canTurnLeft = false;
end
