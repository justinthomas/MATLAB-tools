function vec = symvec(varargin)
% function vec = symvec(varargin)
%
% This function creates a symbolic vector.  The
% length and letter are simply specified in
% varargin and determined based on datatype.


num = 1;
letter = 'A';

for idx = 1:nargin
    if ischar(varargin{idx})
        letter = varargin{idx};
    elseif isnumeric(varargin{idx})
        num = varargin{idx};
    end
end

if (num > 1)
    vec = sym(letter,[num, 1]);
else
    vec = sym(letter);
end

assume(vec, 'real');

end
