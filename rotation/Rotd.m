function R = Rotd(theta, ax)
% Creates a rotation matrix that is rotated an angle of theta about the
% specified axis.  Note: use 'x', 'y', 'z' for the ax argument.


switch ax
    case {'x', 'X', 1}
        
        R = [...
            1   0       0
            0   cosd(theta) -sind(theta)
            0   sind(theta) cosd(theta)];
        
    case {'y', 'Y', 2}
        
        R = [...
            cosd(theta)  0   sind(theta)
            0           1   0
            -sind(theta) 0   cosd(theta)];
        
    case {'z', 'Z', 3}
        
        R = [...
            cosd(theta)  -sind(theta) 0
            sind(theta)  cosd(theta)  0
            0           0           1];
end

end