function vec = TrimVecLength(vec, len, trim_beginning)
%function vec = TrimVecLength(vec, length, trim_from)
%TrimVecLength trims a vector to length len by removing from the beginning
%if trim_beginning = 1 and removing from the end if trim_beginning = 0;

if nargin < 3
    trim_beginning = 1;
end

if trim_beginning
    
    vec = vec(max(length(vec) - len + 1,1):end);
    
else
    
    % #### Should make this work...
    
end