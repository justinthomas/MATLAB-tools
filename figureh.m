function [fh, new, figs] = figureh(name)
  % [fh, new, figs] = figureh(name)
  %
  % Manage figures by name.
  % Call figureh() to get the handle of a figure that you've named.
  % If the figure doesn't already exist, a new one is created.
  
  persistent fhs;
  fh = [];
  new = [];
  
  if nargin > 0
    if ~isfield(fhs, name) || ~isvalid(fhs.(name))
      fhs.(name) = figure();
      set(fhs.(name), 'Name', name);
      new = true;
    else
      new = false;
    end

    fh = fhs.(name);
  end
  
  figs = fhs;
end