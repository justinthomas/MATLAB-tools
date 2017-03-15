function mov = extractVideoFrames(t, filename, destination)
% [] = extractVideoFrames(t_vec, filename, destination)

obj = VideoReader(filename);

tf = obj.NumberOfFrames / obj.FrameRate;

%% 
frame_numbers = round((t ./ tf) .* obj.NumberOfFrames);

% Preallocate movie structure.
mov(1:length(t)) = ...
    struct('cdata', zeros(obj.Height, obj.Width, 'uint8'),...
           'colormap', []);

for idx = 1:length(t)
    mov(idx).cdata = read(obj, frame_numbers(idx));
    
    % imshow(mov(idx).cdata)
    
    if exist('destination', 'var') && ~isempty(destination) && nargout < 1
        imwrite(mov(idx).cdata, [destination, num2str(idx), '.jpg'])
    end
    % pause(.3)
end 

end