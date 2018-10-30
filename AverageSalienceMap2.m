function mean_activation = AverageSalienceMap2(input,alpha,beta,sigma)
%
% This function runs SalienceMap2 R times ( R = 100 in the literature)
% with the given input and parameters,
% then outputs the average of the mean activations for those replications.
% See the topmatter comments for the function SalienceMap2 for more
% details.
%
% Author: Alan P. Knoerr            Last Update: October 10, 2018

R = 100;
mean_activation = SalienceMap2(input,alpha,beta,sigma);
for j = 2:R
    mean_activation = mean_activation + SalienceMap2(input,alpha,beta,sigma);
end
mean_activation = mean_activation/R;
end


