%% Experiments

video_name = '/Users/justin/Movies/ICRA 2014/Swoop_Grasp.mp4';
image_base_name = './im';

% Extract and save the images
times = [17, 18.2, 20.5];
extractVideoFrames(times, video_name, image_base_name);

nums = 1:numel(times);
suffix = '.jpg';
h = 450;
w = 500*ones(length(nums));
c = [...
    450, 400;
    450, 500;
    450, 550];

stitchImages(h, w, c, image_base_name, nums, suffix)

imshow([image_base_name, '_sequence.png']);
