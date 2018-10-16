  function [ failure, Constraint ] = Lab3_Constraint_C3(B, N, R, x, y)

% This function produces a "x + N + R = y * 10 + B" constraint 
% for the constraint network of a constraint satisfaction problem.
% Constraint is a number_of_pairs x 3 array, each row of which
% consists of distinct elements from row vector N, row vector R, and row vector B.
% These row vectors represent variable domains.
% Constraint contains all possible such pairs.
%
% In case no such pairs exist, failure is set to true (logical 1)
% and Constraint is an empty array.  Otherwise, failure is logical 0.
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 18, 2018

% Initializations

m = length(B);
n = length(N);
o = length(R);
max_number_of_pairs = m*n*o;
Constraint = zeros(max_number_of_pairs,3); % preallocate Constraint memory 
k = 0;                                   % initialize Constraint row index

% Determine variable value pairs that satisfy the constraint.

for i = 1:m
    for j = 1:n
        for p = 1:o
            if (x + N(j) + R(p) == y * 10 + B(i)) % constraint
                k = k+1;
                Constraint(k,:)=[B(i),N(j),R(p)];
            end
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