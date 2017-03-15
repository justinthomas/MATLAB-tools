function [phi, theta, psi] = RotToEulZXY(R)
% function [phi, theta, psi] = RotToEulZXY(R)
%
% R is a rotation matrix from frame B to A.  Then, 
% phi, theta, psi are the Euler angles from A to B
% using the ZYX convention
%
% R = Rot(psi, 'z') * Rot(phi, 'x') * Rot(theta, 'y');

% syms phi theta psi
% R = Rot(psi, 'z') * Rot(phi, 'x') * Rot(theta, 'y');

% Assume -pi/2 < phi < pi/2
theta = atan2( -R(3,1,:), R(3,3,:) );
phi = asin( R(3,2,:) );
psi = atan2( -R(1,2,:), R(2,2,:) );

if length(size(R)) > 2
    phi = permute(phi,[3 2 1]);
    theta = permute(theta, [3 2 1]);
    psi = permute(psi, [3 2 1]);
end

phi = real(phi);
theta = real(theta);
psi = real(psi);

end