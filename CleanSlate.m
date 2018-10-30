function [ ] = CleanSlate(hax)
%
% This function deletes all objects that are children of the axes
% with handle "hax," creating a clean slate on which new objects can
% be placed while maintaining the same figure and axes.

% Author: Alan P. Knoerr            Last Update: March 25, 2014

h_children = get(hax,'Children');
delete(h_children);

end

