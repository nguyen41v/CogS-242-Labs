  function [ failure, Constraint ] = Lab3_Constraint_C1( L, R, w)

% This function produces a "1 + 2 * L = w * 10 + R" constraint 
% for the constraint network of a constraint satisfaction problem.
% Constraint is a number_of_pairs x 2 array, each row of which
% consists of distinct elements from row vector L and row vector R.
% These row vectors represent variable domains.
% Constraint contains all possible such pairs.
%
% In case no such pairs exist, failure is set to true (logical 1)
% and Constraint is an empty array.  Otherwise, failure is logical 0.
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 18, 2018

% Initializations

m = length(L);
n = length(R);
max_number_of_pairs = m*n;
Constraint = zeros(max_number_of_pairs,2); % preallocate Constraint memory 
k = 0;                                   % initialize Constraint row index

% Determine variable value pairs that satisfy the constraint.

for i = 1:m
    for j = 1:n
        if (1+2*L(i) == w*10+R(j)) % constraint
            k = k+1;
            Constraint(k,:)=[L(i),R(j)];
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