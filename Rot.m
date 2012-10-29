function R = Rot(theta, ax)
% function R = Rot(theta, ax)
%
% Creates a rotation matrix that is rotated an angle of theta about the
% specified axis.  Note: use 'x', 'y', 'z' for the ax argument.


switch ax
    case {'x', 'X', 1}
        
        R = [...
            1   0       0
            0   cos(theta) -sin(theta)
            0   sin(theta) cos(theta)];
        
    case {'y', 'Y', 2}
        
        R = [...
            cos(theta)  0   sin(theta)
            0           1   0
            -sin(theta) 0   cos(theta)];
        
    case {'z', 'Z', 3}
        
        R = [...
            cos(theta)  -sin(theta) 0
            sin(theta)  cos(theta)  0
            0           0           1];
end

end