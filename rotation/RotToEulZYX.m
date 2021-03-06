function [phi, theta, psi] = RotToEulZYX(R)
% function [phi, theta, psi] = RotToEulZYX(R)
%
% R is a rotation matrix from frame B to A.  Then, 
% phi, theta, psi are the Euler angles from A to B
% using the ZYX convention
%
% R = Rot(psi, 'z') * Rot(theta, 'y') * Rot(phi, 'x');

% syms phi theta psi
% R = Rot(psi, 'z') * Rot(theta, 'y') * Rot(phi, 'x');

% Assume -pi/2 < theta < pi/2
phi = atan2( R(3,2,:), R(3,3,:) );
theta = -asin( R(3,1,:) );
psi = atan2( R(2,1,:) , R(1,1,:) );

if length(size(R)) > 2
    phi = permute(phi,[3 2 1]);
    theta = permute(theta, [3 2 1]);
    psi = permute(psi, [3 2 1]);
end

phi = real(phi);
theta = real(theta);
psi = real(psi);

end