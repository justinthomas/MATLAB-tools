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
%
% in the header of your LaTeX file.

if ~exist('matlab2tikz.m', 'file')
    
    error('matlab2tikz.m cannot be found.  Make sure you have downloaded it from the MATLAB exchange and have it added to your path.')
    
else
    
    if nargin > 1 && ~isempty(figure_handle)
        h = figure_handle;
    else
        h = gcf;
    end
    
    matlab2tikz(...
        'filename',[export_name, '.tikz'],...
        'figurehandle',h,...
        'height','\figureheight',...
        'width','\figurewidth',...
        'showInfo',false,...
        'interpretTickLabelsAsTex',true,...
        'parseStrings',false);
    
    tex_code = [...
        '\n\\begin{figure}', ...
        '\n\t\\centering',...
        '\n\t\\newlength\\figureheight', ...
        '\n\t\\newlength\\figurewidth', ...
        '\n\t\\setlength\\figureheight{\\textwidth}', ...
        '\n\t\\setlength\\figurewidth{\\textwidth}', ...
        '\n\t\\input{', export_name, '.tikz}', ...
        '\n\t\\caption{\\label{fig:}}',...
        '\n\\end{figure}\n'];
    
    if nargout > 0
        
        LaTeXCode = sprintf(tex_code);
        
    else
        clipboard('copy', sprintf(tex_code));
        
        fprintf(['\n\nThe LaTeX code:\n',...
        tex_code,...
        '\nhas been copied to your clipboard.  Don''t forget to have:\n\n\\usepackage{pgfplots}\n\nin your header.\n\n']);
    end
    
end

end