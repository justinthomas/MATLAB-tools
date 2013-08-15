function ProgressBar(p, nchar)
% function ProgressBar(p, nchar)
%
% This function displays a unix-style progress bar of total width = nchar 
% (default: nchar = 80) for the decimal percentage p

clc

if nargin < 2
    nchar = 80;
end

% Consider the end brackets
nchar = nchar - 2;

% If p is a vector, choose the max value
if length(p) > 1
    p = max(p);
end

p = round(p*nchar);

eq = repmat('=', 1, p);
sp = repmat(' ', 1, nchar - p);

str = [eq, '>', sp];
str = str(1:nchar);
str = ['[', str, ']'];

fprintf(str);

end
