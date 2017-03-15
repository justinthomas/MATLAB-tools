function splitTex(tex_file_path)
% splitTex(tex_file_path)
%
% splitTex takes a tex file and splits it up into seprate files that are
% included in the main document. Each section becomes a separate file
% located in a src directory.
%
% See also JOINTEX.

[pathstr, ~, ext] = fileparts(tex_file_path);

if ~strcmp(ext, '.tex')
    warning('Do not know how to handle a %s file', ext);
    return;
end

str = file2str(tex_file_path);

% Might also want to consider subsections
[tokens, sidx, eidx] = regexp(str, '\\section\*?{([\w\s]*)}[\t ]*', 'tokens');

% Make the ./sec folder relative to the root tex file
warning('off', 'MATLAB:MKDIR:DirectoryExists');
if isempty(pathstr)
    pathstr = './';
    mkdir('sec');
else
    mkdir([pathstr, filesep, 'sec']);
end

newline = sprintf('\n');

% Leave the last section because we do not know where it ends
for idx = length(sidx)-1:-1:1

    sec_file_path = ['sec/', num2str(idx), '_', char(tokens{idx}), '.tex'];
    sec_file_path = strrep(sec_file_path, ' ', '_');
    
    secstr = str(eidx(idx)+1:sidx(idx+1)-1);
    str = [str(1:eidx(idx)), '\input{', sec_file_path, '}', newline, str(sidx(idx+1)-1:end)];

    fid = fopen([pathstr, sec_file_path], 'w');
    fprintf(fid, '%s', secstr);
    fclose(fid);
end

fid = fopen(tex_file_path, 'w');
fprintf(fid, '%s', str);
fclose(fid);

end



function str = file2str(filepath)

fid = fopen(filepath, 'r');

% Can we preallocate?
str = [];
while ~feof(fid)
    str = [str, fgets(fid)]; %#ok<AGROW>
end

fclose(fid);

end