function [hrt_T, hyd_T,hyt_T] = SetUpTemplates(hax)
% This function sets up the shape templates and outputs each shape template
%
% Author: Vanessa Nguyen & Candy Shim         Last Update: November 6,2018

% Initializing the shape templates
hrt_T = RedTriangle(hax);
hyd_T = YellowDiamond(hax);
hyt_T = YellowTriangle(hax);
end