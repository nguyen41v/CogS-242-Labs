function [ hrt ] = RedTriangle(hax)
%
% This function creates a small red equilateral triangle with height 1
% as a child of the axes with handle "hax," and positions it with its
% lower left vertex at the origin.

% Author:  Alan P. Knoerr          Last Update: March 25, 2014

X = [0 1 0.5];
Y = [0 0 1];
C = [1 0 0];
hrt = patch(X,Y,C);
set(hrt,'Parent',hax);

end

