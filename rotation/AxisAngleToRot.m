function R = AxisAngleToRot(u, theta)
  % Rot = AxisAngleToRot(axis, angle)
  
  assert(norm(u) > 1e10 * eps, 'Axis undefined!');
  
  u = u / norm(u);
  
  % Rodrigues' Rotation Formula
  R =   cos(theta) * eye(3) ...
      + sin(theta) * hat(u) ...
      + (1 - cos(theta)) * (u * u.');
  
end