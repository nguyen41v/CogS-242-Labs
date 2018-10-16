  function [ failure, Constraint ] = Lab3_Constraint_C4(E, y,z)

% This function produces a "y + O + E = z * 10 + O" constraint 
% for the constraint network of a constraint satisfaction problem.
% Constraint is a number_of_pairs x 2 array, each row of which
% consists of distinct elements from row vector O and row vector E.
% These row vectors represent variable domains.
% Constraint contains all possible such pairs.
%
% In case no such pairs exist, failure is set to true (logical 1)
% and Constraint is an empty array.  Otherwise, failure is logical 0.
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 18, 2018

% Initializations


n = length(E);
Constraint = zeros(n,2); % preallocate Constraint memory 
k = 0;                                   % initialize Constraint row index

% Determine variable value pairs that satisfy the constraint.


for j = 1:n
    if (y + E(j) == z * 10) % constraint
        k = k+1;
        Constraint(k,:)=E(j);
    end
end

% Output the results.

failure = (k == 0);
if (failure == true)
    Constraint = [];
    return
else
    Constraint = Constraint(1:k,:);
end

end