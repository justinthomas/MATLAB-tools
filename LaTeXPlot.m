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
%		max space between ticks=40pt,
%        scaled y ticks = false, 
%        scaled x ticks = false, 
%        y tick label style={/pgf/number format/fixed},
%        x tick label style={/pgf/number format/fixed}
%    }
%}
%
% in the header of your LaTeX file.
%
% This wrapper written by:
% Justin Thomas
% justinthomas@jtwebs.net
% 2013 February 08

if ~exist('matlab2tikz.m', 'file')
    error('matlab2tikz.m cannot be found.  Make sure you have downloaded it from the MATLAB exchange and have it added to your path.')
else
    
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
        '\n\t\\centering',...
        '\n\t\\setlength\\figureheight{\\textwidth}', ...
        '\n\t\\setlength\\figurewidth{\\textwidth}', ...
        '\n\t\\input{', export_name, '.tikz}', ...
        '\n\t\\caption{\\label{fig:', export_name, '}}',...
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

end