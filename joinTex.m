function joinTex(tex_file_path, output_file, delete_files)
% joinTex(tex_file_path)
%
% joinTex assumes that the file at tex_file_path has been split up using
% input files for each section using the convention
% \input{sec/section_name}
%
% The files are incorporated into the main file and then deleted.
%
% See also SPLITTEX.m

pathstr = fileparts(tex_file_path);

str = file2str(tex_file_path);

[section_filenames, sidx, eidx] = regexp(str, '\input{((sec/)?\w*(\.tex)?)}', 'tokens');

% Go backwards so the idxs do not change
for idx = length(sidx):-1:1
    
    sec_filename = char(section_filenames{idx});
    if ~strcmp(sec_filename(end-3:end), '.tex')
        sec_filename = [sec_filename, '.tex']; %#ok<AGROW>
    end
    section_str = file2str([pathstr, sec_filename]);
    str = [str(1:sidx(idx)-2), section_str, str(eidx(idx)+1:end)];
        
end

if ~exist('output_file', 'var') || isempty(output_file)
    output_file = tex_file_path;
end

fid = fopen(output_file, 'w');
fprintf(fid, '%s', str);
fclose(fid);

if exist('delete_files', 'var') && delete_files
    recycle('on');
    for idx = 1:length(section_filenames)
        delete(char(section_filenames{idx}));
    end
end

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

