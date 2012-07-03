function R = Rot(theta, ax)
% Creates a rotation matrix that is rotated an angle of theta about the
% specified axis.  Note: use 'x', 'y', 'z' for the ax argument.


switch ax
    case 'x'
        
        R = [...
            1   0       0
            0   cos(theta) -sin(theta)
            0   sin(theta) cos(theta)];
        
    case 'y'
        
        R = [...
            cos(theta)  0   sin(theta)
            0           1   0
            -sin(theta) 0   cos(theta)];
        
    case 'z'
        
        R = [...
            cos(theta)  -sin(theta) 0
            sin(theta)  cos(theta)  0
            0           0           1];
end

end