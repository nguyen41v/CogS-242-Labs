function [ hrt ] = YellowTriangle(hax)
%
% This function creates a small yellow equilateral triangle with height 1
% as a child of the axes with handle "hax," and positions it with its
% lower left vertex at the origin.

% Author: Vanessa Nguyen & Candy Shim        Last Update: November 6, 2018

X = [0 1 0.5];
Y = [0 0 1];
C = [1 1 0];
hrt = patch(X,Y,C);
set(hrt,'Parent',hax);

end

