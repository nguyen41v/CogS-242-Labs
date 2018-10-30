function [ Map ] = SalienceMap(I_on,beta,stdev_Noise)

% Author: Alan P. Knoerr (after Roggeman et al (2012)
% Last Update: October 3, 2016

% Initializations

number_of_nodes = length(I_on);
I_off = zeros(number_of_nodes,1);
X = zeros(number_of_nodes,1);
Map = zeros(number_of_nodes,1);

alpha = 2.2;
mean_Noise = 0;
% stdev_Noise = 0.03;

rng(0,'twister');               %specify seed and random number generator
number_of_runs = 1;

for j = 1:number_of_runs
    
    for k = 1:5
       Noise = stdev_Noise*randn(number_of_nodes,1) + mean_Noise;
       X = ActivationUpdate(X,alpha,beta,I_on,Noise);
    end

    for k = 6:46
        Noise = stdev_Noise*randn(number_of_nodes,1) + mean_Noise;
        X = ActivationUpdate(X,alpha,beta,I_on,Noise);
    end

    Y = X;
    
    for k = 47:50
        Noise = stdev_Noise*randn(number_of_nodes,1) + mean_Noise;
        X = ActivationUpdate(X,alpha,beta,I_on,Noise);
        Y = Y + X;
    end 

Map = Map + (Y/5);

end

Map = Map/number_of_runs;

end

