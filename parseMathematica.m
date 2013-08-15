function str = parseMathematica(str)

if isequal(exist(str, 'file'), 2)
    
    % Open the file
    fid = fopen(str);
    
    % Parse each line
    str = [];
    while ~feof(fid)
        str = [str, parse(fgetl(fid)), ';\n']; %#ok<AGROW>
    end
    
    % Close the file
    fclose(fid);
    
    % Evaluate newlines and such
    str = sprintf(str);
    
else
    str = parse(str);
end

clipboard('copy', str)

end

function str = parse(str)

str = strrep(str, ' = ', '=');
str = strrep(str, '[t]', '');
str = strrep(str, 'Sin', 'sin');
str = strrep(str, 'Cos', 'cos');
% str = strrep(str, '\[', '[');
% str = strrep(str, '^[power]', 'dot');
str = regexprep(str, '\t', ',');

% Replace strings that look like Derivative[1][zq] with zq^(1)
str = regexprep(str, 'Derivative\[(\d+)\]\[([a-zA-Z_0-9θ]+)\]', '$2$1');

str = strrep(str, '\[Beta]^\[Prime]\[Prime]', 'b2');
str = strrep(str, '\[Beta]^\[Prime]', 'b1');
str = strrep(str, '\[Beta]^(3)', 'b3');
str = strrep(str, '\[Beta]^(4)', 'b4');
str = strrep(str, 'θ', '\[Theta]');
str = strrep(str, '\[Theta]^\[Prime]\[Prime]', 'th2');
str = strrep(str, '\[Theta]^\[Prime]', 'th1');
str = strrep(str, '\[Theta]', 'th0');
str = strrep(str, 'xq^\[Prime]\[Prime]', 'x2');
str = strrep(str, 'zq^\[Prime]\[Prime]', 'z2');
str = strrep(str, 'xq^(3)', 'x3');
str = strrep(str, 'zq^(3)', 'z3');
str = strrep(str, 'xq^(4)', 'x4');
str = strrep(str, 'zq^(4)', 'z4');

% Fix stuff Special characters
str = strrep(str, 'th01', 'th1');

% Square root appears both ways
str = strrep(str, '\[Sqrt]','sqrt');
str = strrep(str, 'Sqrt', 'sqrt');

% Anything else
str = strrep(str, '\[Beta]', 'b0');
str = strrep(str, '/', './');
str = strrep(str, '*', '.*');
str = strrep(str, '^', '.^');
str = strrep(str, '[', '(');
str = strrep(str, ']', ')');
str = strrep(str, '==', '=');

end