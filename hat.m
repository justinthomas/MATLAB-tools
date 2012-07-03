function ss = hat(vec)
% function ss = hat(vec)
%   The hat function maps a vector in R^3 to its
%   skew symmetric matrix in R^(3x3)

ss = [...
    0, -vec(3), vec(2);...
    vec(3), 0, -vec(1);...
    -vec(2), vec(1), 0];

end