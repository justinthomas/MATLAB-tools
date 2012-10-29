function norms = rownorm(vec)
% This just takes an m by n matrix and computes the Euclidean norm of the
% rows.  A vector of m by 1 is returned as norms.

% I believe this is the fastest
norms = sqrt(sum(vec.^2,2));

% Other approaches
% norms = sqrt(sum(bsxfun(@power,vec,2),2));
% norms = sqrt(bsxfun(@sum,bsxfun(@power,vec,2),2));

end