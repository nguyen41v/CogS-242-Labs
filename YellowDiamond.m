function [ hrt ] = YellowDiamond(hax)
%
% This function creates a small yellow diamond with height 1
% as a child of the axes with handle "hax," and positions it with its
% lower left vertex at the origin.

% Author:  Vanessa Nguyen & Candy Shim        Last Update: October 30, 2018

X = [0.5 1  0.5 0];
Y = [0 0.5 1 0.5];
C = [1 1 0];
hrt = patch(X,Y,C);
set(hrt,'Parent',hax);

end

