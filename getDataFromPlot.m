function [data, lh] = getDataFromPlot(a)

if nargin < 1
    a = gca;
end

lh = findobj(a, 'Type', 'line');
x = get(lh, 'Xdata');
y = get(lh, 'Ydata');
z = get(lh, 'Zdata');

data.x = x;
data.y = y;
data.z = z;

end