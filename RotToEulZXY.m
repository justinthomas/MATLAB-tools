function [phi theta psi] = RotToEulZXY(R)
% Convert a rotation matrix to euler angles using the ZXY convention

% syms phi theta psi
% x = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];
% Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
% Rz = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
% Rot = Rz*Rx*Ry;

phi = asin(R(3,2,:));
theta = asin(R(3,1,:)./-cos(phi));
psi = acos(R(2,2,:)./cos(phi));

phi = real(permute(phi,[3 2 1]));
theta = real(permute(theta, [3 2 1]));
psi = real(permute(psi, [3 2 1]));

phi = real(phi);
theta = real(theta);
psi = real(psi);

end