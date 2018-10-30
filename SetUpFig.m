function [ hfig, hax ]= SetUpFig( )
%
% This function illustrates how to set up a figure for graphics,
% using invisible axes, both scaled from 0 to 10, to make it possible
% to specify object locations in the figure.
% The default background color is blue.
% This function returns a vector of handles, one for the figure
% and one for the axes.

% Author: Alan P. Knoerr         Last Update: March 25, 2014

hfig = figure;
set(hfig,'Color',[0 0 1]);
set(hfig,'units','normalize','outerposition',[0 0 1 1]); % maximize window
hax = axes;
set(hax,'Visible','off','XLim',[0 10],'YLim',[0 10]);
axis square


end

