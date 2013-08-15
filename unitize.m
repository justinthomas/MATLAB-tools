function units = unitize(matrix, dim)
% units = unitize(matrix, dim)
%
% This takes an m by n matrix and unitizes the columns or rows based on the
% specified dimension.  dim = 1 means vectors are the columns and dim = 2
% means the vectors are the rows.  A vector of m by n is returned as units.

if nargin < 2
    dim = 1;
end

norms = sqrt(sum(matrix.^2,dim));

switch dim
    
    % Unitize Columns
    case 1
        units = matrix ./ repmat(norms, [size(matrix,1), 1]);
        
    % Unitize Rows
    case 2
        units = matrix ./ repmat(norms, [1, size(matrix,2)]);
        
end

end

