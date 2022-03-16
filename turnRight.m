% global brick
% global stopDistance
% global canTurnRight
% global robotSpeed

% turn right
brick.MoveMotorAngleRel('C', robotSpeed, 520);
brick.MoveMotorAngleRel('A', -robotSpeed, 520);

% get distance
distance = brick.UltrasonicDist(3);

% if distance at left side is greater than stopDisatnce, then set
% canTurnRight to true, else false
if distance > stopDistance
    canTurnRight = true;
else 
    canTurnRight = false;
end
