function qout = QuatToStruct(q)
% q = QuatToStruct(q);
%
% Convert a quaternion expressed as a vector to a quaternion struct.  
%
% If qin = [w, x, y, z],
%
% qout.w = w;
% qout.x = x;
% qout.y = y;
% qout.z = z;

qout.w = q(1);
qout.x = q(2);
qout.y = q(3);
qout.z = q(4);

end

