function str = parse_Mathematica(str)

str = strrep(str, '[t]', '');
str = strrep(str, 'Sin', 'sin');
str = strrep(str, 'Cos', 'cos');
str = strrep(str, '\[', '[');
% str = strrep(str, '^[power]', 'dot');
str = strrep(str, ' ', '*');
% regexprep

str = strrep(str, '[Beta]^[Prime]', 'b1');
str = strrep(str, '[Beta]', 'b0');
str = strrep(str, '[Theta]', 'th0');

str = strrep(str, '[', '(');
str = strrep(str, ']', ')');

end