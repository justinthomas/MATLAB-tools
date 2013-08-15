function [ phi, theta, psi ] = QuatToEulZYX( q )
% function [ phi, theta, psi ] = QuatToEulZXY( q )
%
% Input: q is a quaternion [w; x; y; z]

% Estimate R from the quaternion
R = Quat2Rot( q );

% Determine the Euler Angles
[phi, theta, psi] = RotToEulZYX( R );

end