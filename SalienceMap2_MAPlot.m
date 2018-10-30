function mean_activation = SalienceMap2_MAPlot(max, alpha, beta, sigma)
% 
% For set sizes ranging between the integers 1 and "max",
% this function generates a plot of the average mean activation of the
% salience map implemented in the function SalienceMap2.
%
% It also outputs a vector containing these average mean activations.
%
% See that SalienceMap2 for further details concerning the paramters.
%
% Author: Alan P. Knoerr              Last Update: October 10, 2018
%  

% Initializations

set_size = 1:max;                 % initialize set sizes
N = 70;                             % number of nodes in the network
input = zeros(1,N);                 % initialize input vector
mean_activation = zeros(1,max);     % initialize mean activations vector

% Compute Mean Activations

for i = 1:max
    input(1:i)=1;
    mean_activation(i) = AverageSalienceMap2(input,alpha,beta,sigma);
end
    
% Plot Mean Activation vs Set Size

plot(set_size, mean_activation);
title(['Mean Activation vs Set Size, ','beta = ',num2str(beta)]);
xlabel('Set Size');
ylabel('Mean Activation');
end

