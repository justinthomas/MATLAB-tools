function vec = symvec(varargin)
% function vec = symvec(letter, number)
%
% This function creates a symbolic vector.  The
% length and letter are simply specified in
% varargin and determined based on datatype.

% Defaults
num = 3;
letter = 'A';

for idx = 1:nargin
    if ischar(varargin{idx})
        letter = varargin{idx};
    elseif isnumeric(varargin{idx})
        num = varargin{idx};
    end
end

if isequal(num,1)
    vec = sym(letter);
else
    vec = sym(letter,[num, 1]);
end

vec = sym(vec,'real');

end