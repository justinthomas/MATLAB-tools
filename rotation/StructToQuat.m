function q = StructToQuat(q)
% q = QuatToStruct(q);
%
% Convert a quaternion expressed as a struct to a quaternion vector.  
%
% Convention: q = [w, x, y, z],

q = [q.w; q.x; q.y; q.z];

end

