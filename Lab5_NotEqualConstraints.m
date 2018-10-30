function [ failure ] = Lab5_NotEqualConstraints( U )

% This function checks to see if a proposed partial solution vector U to the
% DONALD + GERALD = ROBERT cryptarithmetic problem
% satisfies all the "not equal" constraints of the problem
% by checking to see if any of its values occur more than once.
  % The values are assumed to lie in the set {1, 2, 3, 4, 6, 7, 8, 9}.
%
% 'failure' is set to 'true' if one of these constraints isn't satisfied,
% 'failure' is set to 'false' otherwise.
% 
% Author: Alan Knoerr              Last Update: September 28, 2015

% Determine which values are contained in U.

values = [ 1, 2, 3, 4, 6, 7, 8, 9];

values = values( ismember(values, U) ); 
      
% Check to see if any of these values occur more than once in U.

n = length(values);

for i = 1:n
    bitsum = sum( ismember(U, values(i)) );
    if bitsum > 1
       failure = true;
       return
    end
end

% If you get this far, none of the "not equal" constraints have been violated.
 
failure = false;

end

