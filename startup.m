% Add the current directory

this_path = fileparts(which(mfilename));
addpath(genpath(this_path))

disp('Loaded MATLAB-tools into path');