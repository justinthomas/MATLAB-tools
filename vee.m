function vec = vee(ss)
% function vec = vee(skewsymmetric)
%   The vee function maps a skew-symmetric 
%   matrix in R3x3 to a vector in R3

if isa(ss,'sym')
    ss = expand(simplify(ss));
end

if ~isequal(ss(3,2),-ss(2,3)) || ~isequal(ss(1,3),-ss(3,1)) || ~isequal(ss(2,1),-ss(1,2))
    warning('The provided matrix is not skew symmetric.')
end

vec = [ss(3,2); ss(1,3); ss(2,1)];

if isa(ss,'sym')
    vec = simplify(vec);
end

end