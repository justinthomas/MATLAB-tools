function img = invertImage(img)
% img = invertImage(img)

img_path = [];

if ischar(img)
    img_path = img;
    try
        img = imread(img_path);
    catch
        disp('Not implemented yet...')
        keyboard
    end
end

% Actually do the inversion
img = uint8( -int32(img) + 255);

if ~isempty(img_path)
    [pathstr, name, ext] = fileparts(img_path);
    newfile = [pathstr, filesep, name, '_inverted', ext];
    imwrite(img, newfile);
    img = newfile;
end

end