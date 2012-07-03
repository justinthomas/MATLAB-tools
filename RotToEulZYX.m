function [phi theta psi] = RotToEulZYX(R)
% Convert a rotation matrix to euler angles using the ZXY convention

% syms phi theta psi
% x = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];
% Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
% Rz = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
% Rot = Rz*Rx*Ry;

theta = asin(-R(3,1,:));
phi = asin(R(3,2,:)./cos(theta));
psi = asin(R(2,1,:)./cos(theta));

phi = permute(phi,[3 2 1]);
theta = permute(theta, [3 2 1]);
psi = permute(psi, [3 2 1]);

end