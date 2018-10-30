function [ hpatch ] = MovePatch(hpatch,DeltaX,DeltaY)
%
% This function moves the patch object with handle "hpatch,"
% makes it a child of the object (typically axes) with handle
% "h_new_parent," then translates its XData by the increment DeltaX
% and translates its YData by the increment DeltaY.
% This function returns the handle of the patch copy.

% Author: Vanessa Nguyen & Candice Shim       Last Update: October 23, 2018

oldX = get(hpatch,'XData');
oldY = get(hpatch,'YData');
newX = oldX + DeltaX;
newY = oldY + DeltaY;
set(hpatch,'XData',newX,'YData',newY);

end

