function norms = colnorm(vec)
% This just takes an m by n matrix and computes the Euclidean norm of the
% columns.  A vector of 1 by n is returned as norms.

norms = sqrt(sum(vec.^2,1));

end

