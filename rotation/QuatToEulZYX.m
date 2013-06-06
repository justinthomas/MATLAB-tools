function [ phi, theta, psi ] = QuatToEulZYX( q )
% function [ phi, theta, psi ] = QuatToEulZXY( q )

% Estimate psi from the quaternion
R = Quat2Rot( q );

% Determine the Euler Angles
[phi, theta, psi] = RotToEulZYX( R );

end

