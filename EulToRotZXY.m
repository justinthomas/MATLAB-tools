function Rot = EulToRotZXY(phi, theta, psi)
% Rot = EulToRotZXY(phi,theta,psi)
%
% Written by Justin Thomas
% February 2012

% This function returns a rotation matrix based on the Euler angles
% provided.  It uses the ZXY convention.

% We use the ZXY rotation convention with angles psi, theta, phi,
% representing yaw, pitch, and roll, respectively.
% Rx = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];
% Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
% Rz = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
% Rot = Rz*Rx*Ry;

Rot = zeros(3,3,length(phi));

phi = permute(phi,[3,2,1]);
theta = permute(theta, [3,2,1]);
psi = permute(psi, [3,2,1]);

Rot(:,:,:) = [...
    cos(psi).*cos(theta)-sin(phi).*sin(psi).*sin(theta),...
    -cos(phi).*sin(psi),...
    cos(psi).*sin(theta)+cos(theta).*sin(phi).*sin(psi);...
    cos(theta).*sin(psi)+cos(psi).*sin(phi).*sin(theta),...
    cos(phi).*cos(psi),...
    sin(psi).*sin(theta)-cos(psi).*cos(theta).*sin(phi);...
    -cos(phi).*sin(theta),...
    sin(phi),...
    cos(phi).*cos(theta)];

end