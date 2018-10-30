function [ result ] = Lab4_CryptArithmetic()

% This function produces a (partial)solution to the cryptarithmetic problem
% DONALD + GERALD = ROBERT
% as a constraint satisfaction problem by establishing domain and arc
% consistency for the constraint network for the problem.
%
% See the Lab 3, Lab 4, and Lab 5 handouts for information on interpreting
% 'result'.  If a solution is found, then 'result' contains the solution and
% the user is informed that it has been found. If only a partial solution
% has been found, the user is informed of that fact and 'result' constains
% the partial solution.
%
% This function also determines and reports its run time.
%
% This function calls the following functions with the syntax indicated:
%
% Domain = Lab4_InitializeDomains()      Note: Domain is a structure
% ParameterArray = Lab4_InitializeParameters()
% [failure, Domain] = Lab5_FirstComponent(Domain, parameters)
% [failure, Domain] = Lab5_SecondComponent(Domain, parameters)
% Domain = Lab4_ThirdComponent(Domain)
% Lab4_OutputStatus(Domain)
%
% Author: Alan P. Knoerr             Last Update: September 28, 2015

% Initializations

tic                                 % start the timing stopwatch

ParameterArray = Lab4_InitializeParameters();

failure_1 = true;

failure_2 = true;

k = 0;

% Prune domains to make component networks domain and arc consistent.

while (failure_2 == true)           % Parameters must work for both Components 1 & 2.
    
    while (failure_1 == true)       % Use Component 1 as an initial parameter screen.
       k = k + 1;
       parameters = ParameterArray(k,:);
       Domain = Lab4_InitializeDomains;  % Refresh 'Domain' for new parameter values.
       [failure_1, Domain] = Lab5_FirstComponent(Domain,parameters);
    end

    % Continue to Component 2 using the same parameter values working for
    % Component 1.
    
    [failure_2, Domain] = Lab5_SecondComponent(Domain,parameters);

    if (failure_2 == true)
        failure_1 = true;         
    end

end

% Continue to Component 3 using the same parameter values working for
% Components 1 & 2.

Domain = Lab4_ThirdComponent(Domain);

% Finish up and determine whether or not you have a solution
% to the  whole problem, or just a consistent network.

Lab4_OutputStatus(Domain);

result = Domain;

% Also report the run time for the function.

elapsedTime = num2str(toc);
disp(['This function took ', elapsedTime, ' seconds to run.'])

end


