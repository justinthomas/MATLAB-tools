function i = findMatchingParen(s, n)
% i = findMatchingParen(s, n);
%
% findMatchingParen returns the index, i, of the parenthesis that matches 
% the parenthesis at s(n)

% Switch between searching forwards or backwards
switch s(n)
    case '('
        d = 1;
        e = length(s);
    case ')'
        d = -1;
        e = 1;
end

% Counters for the number of left and right symbols
l = d;
r = 0;

% Parse the string and increment counters
% Note: we could probably vectorize this
for i = n+d:d:e
    l = l + (s(i)=='(');
    r = r + (s(i)==')');

    if l == r
        return;
    end
end

% If no match, return nan
i = nan;

end