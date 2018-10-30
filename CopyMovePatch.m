function [ hcopy ] = CopyMovePatch(hpatch,h_new_parent,DeltaX,DeltaY)
%
% This function copies the patch object with handle "hpatch,"
% makes it a child of the object (typically axes) with handle
% "h_new_parent," then translates its XData by the increment DeltaX
% and translates its YData by the increment DeltaY.
% This function returns the handle of the patch copy.

% Author: Alan P. Knoerr          Last Update: March 25, 2014

hcopy = copyobj(hpatch,h_new_parent);
oldX = get(hpatch,'XData');
oldY = get(hpatch,'YData');
newX = oldX + DeltaX;
newY = oldY + DeltaY;
set(hcopy,'XData',newX,'YData',newY);

end

