function img = stitchImages(h, w, c, prefix, nums, ext)
% 
% img = stitchImages(h, w, c, prefix, nums, ext)
% 
% h is an integer that is the final image patch in pixels  (they must all be the same)
% w is the desired final patch width (these can vary)
% c is the center of the patch relative to the original image
% prefix is the image name prefix
% nums can be used to choose the image numbers that are used
% suffix is the image name suffix (e.g. '.png' or '.jpg')

% Ignore warnings about allocation
%#ok<*SAGROW,*AGROW>


dims = [];
if nargin < 5
    im = prefix;
    for idx = 1:length(im)
        dims = [dims; size(im(idx).cdata)'];
    end
else    
    for idx = 1:length(nums)
        im(idx).cdata = imread([prefix, num2str(nums(idx)), '.', ext]);
        dims = [dims, size(im(idx).cdata)'];
    end
end

lim = min(dims, [], 2);

rows = 1:lim(1);
cols = 1:lim(2);

%%



img = [];
for idx = 1:length(im)
    img = [img, im(idx).cdata(...
        rows( c(idx,1) : min(c(idx,1)+h, size(im(idx).cdata, 1))), ...
        cols( c(idx,2) : min(c(idx,2)+w(idx), size(im(idx).cdata, 2))),:)];
    
    if idx ~= length(im)
        img = [img, 256*ones(size(img,1), 1, 3);];
    end
end

imshow(img);

if nargin > 4
    imwrite(img, [prefix, '_sequence.', ext], ext)
end

end
