  function [ failure, Constraint ] = NotEqualConstraint( U, V)

% This function produces a "not equal" constraint 
% for the constraint network of a constraint satisfaction problem.
% Constraint is a number_of_pairs x 2 array, each row of which
% consists of distinct elements from row vector U and row vector V.
% These row vectors represent variable domains.
% Constraint contains all possible such pairs.
%
% In case no such pairs exist, failure is set to true (logical 1)
% and Constraint is an empty array.  Otherwise, failure is logical 0.
%
% Author: Alan Knoerr              Last Update: September 21, 2015

% Initializations

m = length(U);
n = length(V);
max_number_of_pairs = m*n;
Constraint = zeros(max_number_of_pairs,2); % preallocate Constraint memory 
k = 0;                                   % initialize Constraint row index

% Determine variable value pairs that satisfy the constraint.

for i = 1:m
    for j = 1:n
        if not(U(i) == V(j))
            k = k+1;
            Constraint(k,:)=[U(i),V(j)];
        end
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

