function ProgressBar(p, nchar)
% function ProgressBar(p, nchar)
%
% This function displays a unix-style progress bar of width nchar for the
% decimal percentage p

clc

if nargin < 2
    nchar = 40;
end

p = round(p*nchar);

eq = repmat('=', 1, p);
sp = repmat(' ', 1, nchar - p);

str = [eq, '>', sp];
str = str(1:nchar);
str = ['[', str, ']'];

fprintf(str);

end
