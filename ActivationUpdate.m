function X  = ActivationUpdate(X, alpha, beta, I, Noise )

%   Alan P. Knoerr                Last Update: October 3, 2016

% Compute the activation function for the current activation of all nodes.

FX = (X>0).*(X./(X+1));                 

% Use the output of the activation function to 
% update the activation of all nodes,
% For efficiency this calculation is divided into two parts.

A = (alpha + beta)*FX + I + Noise;      % primarily excitation & input
B = beta*sum(FX);                              % primarily inhibition
X = A - B;

end

