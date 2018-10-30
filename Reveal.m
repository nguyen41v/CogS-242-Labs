function [ ] = Reveal( hax )
%
% This function reveals the objects that are children of the axes
% with handle "hax" by setting their 'Visible' property to "on."

% Author: Alan P. Knoerr        Last Update: March 25, 2014

h_children = get(hax,'Children');
set(h_children,'Visible','on');

end

