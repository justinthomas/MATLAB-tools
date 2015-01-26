function LaTeXCode = LaTeXPlot(export_name, figure_handle)
% function LaTeXCode = LaTeXPlot(export_name, figure_handle)
% 
% LaTeXPlot exports the figure specified by figure_handle or uses gcf (if
% figure_handle is not set) to export the figure to export_name.tikz in 
% the current folder for use in LaTeX.  The necessary code for LaTeX is
% copied to your clipboard and exported to the screen if no output is
% provided.  If an output is provided, the LaTeX code is returned as
% LaTeXCode.
%
% Note: This function requires the use of matlab2tikz, which is available
% through the MATLAB exchange.  Don't forget to have
% 
% \usepackage{pgfplots}
% \newlength\figureheight
% \newlength\figurewidth
% % A setting that would be applied to all pgfplots
% \pgfplotsset{every axis/.append style={
%   max space between ticks=40pt,
%   scaled y ticks = false, 
%   scaled x ticks = false, 
%   y tick label style={/pgf/number format/fixed},
%   x tick label style={/pgf/number format/fixed},
%   compat=1.10
%   }
% }
%
% in the header of your LaTeX file.
%
% This wrapper written by:
% Justin Thomas
% justinthomas@jtwebs.net
%
% Last edited:
% 2015 January 26

if ~exist('matlab2tikz.m', 'file')
    
    warning('matlab2tikz.m cannot be found');
    str = input('Automatic setup? (y/n): ', 's');
    
    switch str
        case {'y', 'Y'}
            disp('Downloading the most recent version and adding it to your path...')
            this_path = fileparts(which(mfilename));
            zipname = 'matlab2tikz.zip';
            zip_path = [this_path, filesep, zipname];
            urlwrite('https://github.com/nschloe/matlab2tikz/archive/master.zip', zip_path);
            unzip(zip_path, [this_path, filesep, 'matlab2tikz']);
            delete(zip_path);
            addpath(genpath([this_path, filesep, 'matlab2tikz']));
        otherwise
            disp('Please add matlab2tikz to your path and try again.');
            return
    end
end


if nargin > 1 && ~isempty(figure_handle)
    h = figure_handle;
else
    h = gcf;
end

% So that MATLAB doesn't throw a warning, we need the interperter of the legends set to none
legend_handles = findobj(h,'Type','axes','Tag','legend');
for idx = 1:length(legend_handles)
    set(legend_handles(idx), 'Interpreter', 'none');
end

% Now, convert to tikz
matlab2tikz(...
    'filename',[export_name, '.tikz'],...
    'figurehandle',h,...
    'height','\figureheight',...
    'width','\figurewidth',...
    'showInfo',false,...
    'parseStrings',false);

% The LaTeX code for your LaTeX document
tex_code = [...
    '\n\\begin{figure}[!htb]', ...
    '\n  \\centering',...
    '\n  \\setlength\\figureheight{0.5\\columnwidth}', ...
    '\n  \\setlength\\figurewidth{0.8\\columnwidth}', ...
    '\n  \\input{', export_name, '.tikz}', ...
    '\n  \\caption{}',...
    '\n  \\label{fig:', export_name, '}',...
    '\n\\end{figure}\n'];

% How are we giving you the code
if nargout > 0
    
    LaTeXCode = sprintf(tex_code);
    
else
    clipboard('copy', sprintf(tex_code));
   
    fprintf(['\n\nThe LaTeX code:\n',...
        tex_code,...
        '\nhas been copied to your clipboard.\n']);
end

end
