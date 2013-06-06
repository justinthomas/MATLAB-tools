function R = Quat2Rot( q )
% function R = Quat2Rot( q )
%
% Input: q is a quaternion [w; x; y; z]
%
% Quat2Rot returns a rotation matrix using the conversion from
% http://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation#Conversion_to_and_from_the_matrix_representation

% Normalize the quaternion
q = unitize(q);

a = q(1);
b = q(2);
c = q(3);
d = q(4);

% And determine the rotation matrix
R = [...
    a.^2 + b.^2 - c.^2 - d.^2, 2.*b.*c - 2.*a.*d, 2.*b.*d + 2.*a.*c;
    2.*b.*c + 2.*a.*d, a.^2 - b.^2 + c.^2 - d.^2, 2.*c.*d - 2.*a.*b;
    2.*b.*d - 2.*a.*c, 2.*c.*d + 2.*a.*b, a.^2 - b.^2 - c.^2 + d.^2];

end

