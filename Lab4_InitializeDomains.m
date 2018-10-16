function [ Domain ] = Lab4_InitializeDomains()

% This function intializes the domains for the main variables.
% All these domains set to the same set of values initially. 
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 25, 2018

% Initialize staring domain 

v = [1,2,3,4,6,7,8,9];

% Set all possible solutions to letters initially

Domain = struct('A',v,'B',v,'E',v,'G',v,'L',v,'N',v,'O',v,'R',v);
end