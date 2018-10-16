function [ ParameterArray ] = Lab4_InitializeParameters()

% This function intializes the values for the main parameters.
% All the values that are possible are 0 or 1. 
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 25, 2018

% Initialize array with zeroes

ParameterArray = zeros (16,4);

% Set each row to different possible configurations.

ParameterArray(1,:) = [0 0 0 0];
ParameterArray(2,:) = [1 0 0 0];
ParameterArray(3,:) = [0 1 0 0];
ParameterArray(4,:) = [0 0 1 0];
ParameterArray(5,:) = [0 0 0 1];
ParameterArray(6,:) = [1 1 0 0];
ParameterArray(7,:) = [1 0 1 0];
ParameterArray(8,:) = [1 0 0 1];
ParameterArray(9,:) = [0 1 1 0];
ParameterArray(10,:) = [0 1 0 1];
ParameterArray(11,:) = [0 0 1 1];
ParameterArray(12,:) = [1 1 1 0];
ParameterArray(13,:) = [0 1 1 1];
ParameterArray(14,:) = [1 0 1 1];
ParameterArray(15,:) = [1 1 0 1];
ParameterArray(16,:) = [1 1 1 1];
end