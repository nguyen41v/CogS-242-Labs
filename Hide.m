function [ ] = Hide( hax )
%
% This function hides the objects that are children of the axes
% with handle "hax" by setting their 'Visible' property to "off."

% Author: Alan P. Knoerr        Last Update: March 25, 2014

h_children = get(hax,'Children');
set(h_children,'Visible','off');

end

