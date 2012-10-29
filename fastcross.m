function c = fastcross(a, b)
% function c = fastcross(a, b)
% This is simply a fast cross product of vectors a and b.  Note, a and b
% can also be of the form a = [a1, a2, ..., an] and b = [b1, b2, ..., bn]
% where a1, a2, ..., an represent column vectors that are crossed with b1,
% b2, ..., bn, respectively.

if size(a,2) > 1
    c = [...
        a(:,2).*b(:,3) - a(:,3).*b(:,2), ...
        a(:,3).*b(:,1) - a(:,1).*b(:,3), ...
        a(:,1).*b(:,2) - a(:,2).*b(:,1)]';
else
    c = [...
        a(2).*b(3) - a(3).*b(2)
        a(3).*b(1) - a(1).*b(3)
        a(1).*b(2) - a(2).*b(1)];
end
end