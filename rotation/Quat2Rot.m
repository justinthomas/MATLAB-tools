function R = Quat2Rot( q )
% function R = Quat2Rot( q )
%
% Input: q is a quaternion [w; x; y; z]
%
% Quat2Rot returns a rotation matrix using the conversion from
% http://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation#Conversion_to_and_from_the_matrix_representation

% Normalize the quaternion(s)
q = unitize(q, 1);

a = permute(q(1, :), [3, 1, 2]);
b = permute(q(2, :), [3, 1, 2]);
c = permute(q(3, :), [3, 1, 2]);
d = permute(q(4, :), [3, 1, 2]);

% And determine the rotation matrix
R = [...
    a.^2 + b.^2 - c.^2 - d.^2, 2.*b.*c - 2.*a.*d, 2.*b.*d + 2.*a.*c;
    2.*b.*c + 2.*a.*d, a.^2 - b.^2 + c.^2 - d.^2, 2.*c.*d - 2.*a.*b;
    2.*b.*d - 2.*a.*c, 2.*c.*d + 2.*a.*b, a.^2 - b.^2 - c.^2 + d.^2];

end

