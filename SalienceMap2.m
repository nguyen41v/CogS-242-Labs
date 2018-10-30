function [mean_activation, output] = SalienceMap2(input,alpha,beta,sigma)
%
% This function implements the On-Center Off-Surround salience map of
% Roggeman et al.(2010), Sengupta et al.(2014), and Sengupta et al. (2017):
%
% "input" is a non-negative vector of length N (taken to be 70 in the 
%         literature)whose ith component represents the transient input
%         to node i(in the literature the stimulus presentation takes
%         5 time steps, and input values are either 0 or 1, or 1 or 0.33),
% "alpha" is the excitation parameter (taken to be 2.2 in the literature),
% "beta"  is the inhibition parameter (taken to lie between 0.01 and 0.15
%         in the literature), and
% "sigma" is the standard deviation for mean-zero Gaussian noise added
%         at each time step (taken to be 0.03 in the literature).
%
% The recurrent network is iterated M = 50 times in the literature;
%
% "output" is the non-negative vector of length N whose ith component
%          is the activation of the ith node after the Mth iteration, 
%          provided that is positive, and zero otherwise, while
% "mean_activation" is the average of all the "output" node values.
%
% Author: Alan P. Knoerr                 Last Update: October 10, 2018
%

% Check Stability of Input(see Sengupta et al. (2014))

n = sum(input > 0);     % number of active nodes
if not((alpha + beta) < ((alpha - (n-1)*beta)^2))
    disp(['set size = ',num2str(n)]);
    disp("input potentially unstable");
end

% Initializations

N = length(input);                      % number of nodes
M = 50;                                 % number of interations
S = 5;                                  % stimulus duration, in time-steps
noise = normrnd(0,sigma,[1,70]);        % Gaussian noise vector
x = input + noise;                      % activation vector

% Stimulate the Network

for k = 2:S
    y = x.*(x > 0);                     % inactive nodes suppressed
    z = y./(1+y);                       % activation function
    noise = normrnd(0,sigma,[1,70]);
    x = (alpha + beta)*z -beta*sum(z) + input + noise;  %update activation
end

% Iterate After Stimulation

for k = (S+1):M
    y = x.*(x > 0);                     % suppress inactive nodes 
    z = y./(1+y);                       % activation function
    noise = normrnd(0,sigma,[1,70]);
    x = (alpha + beta)*z -beta*sum(z) + noise;  %update activation
end

% Calculate Mean Activation and Output

    output = x.*(x > 0);                     % suppress inactive nodes  
    mean_activation = sum(output)/N;            % output updated mean activation
end

