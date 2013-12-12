function [] = NightMode(inverted)
% [] = NightMode(non_inverted);
% 
% If you want to use this on an inverted screen (recommended), no input is
% necessary.  Otherwise, specify non_inverted [bool].
%
% Inspired from: http://undocumentedmatlab.com/blog/changing-matlab-command-window-colors/
%
% edit([prefdir, '/matlab.prf'])
% 
% Note: it may be useful to have this link to invert hex colors:
% http://www.mattlag.com/scripting/hexcolorinverter.php

com.mathworks.services.Prefs.setBooleanPref('ColorsUseSystem',0);

things = {...
    'ColorsBackground', '000000', ...
    'ColorsText', 'DDDDDD', ...
    'Colors_M_Comments', '7CDD7C', ...
    'Colors_M_Keywords', '8888FF', ...
    'Colors_M_Strings', 'CC8989', ...
    'Colors_M_UnterminatedStrings', 'FFC600', ...
    'Colors_M_SystemCommands', 'D8D8D8', ...
    'Colors_M_Errors', 'D25252', ...
    'Colors_M_Warnings', 'D197D9'};

for idx = 1:2:numel(things)/2
    
    % The hex color
    hc = things{idx + 1};
    
    % If inverted mode, invert the hex color
    if exist('inverted', 'var') && inverted
        hc = hexInvert(hc);
    end
    
    % The rgb color scaled from 0 to 1
    c = [hex2dec(hc(1:2)), hex2dec(hc(3:4)), hex2dec(hc(5:6))] ./ 255;
    
    % The silly java color
    jc = java.awt.Color(c(1), c(2), c(3));

    % Set the color
    com.mathworks.services.Prefs.setColorPref(things{idx}, jc);
    
    % Update the things depending on the color
    com.mathworks.services.ColorPrefs.notifyColorListeners(things{idx});

end

end

function ih = hexInvert(h)

r = 255 - hex2dec(h(1:2));
g = 255 - hex2dec(h(3:4));
b = 255 - hex2dec(h(5:6));

ih = [dec2hex(r,2), dec2hex(g,2), dec2hex(b,2)];

end