function solution_found = Lab2_CheckSolution( current_state )

% This function checks whether the permutation vector current_state
% is a solution to the crypt-arithmetic problem 
%        DONALD + GERALD = ROBERT,
% as described in the Cog Sci 242 Lab 2 (Fall 2015) handout.
%
% solution_found is logical true if current state is a solution,
% and is logical false otherwise.
%
% Author:  Alan P. Knoerr           Last Update: September 8, 2015

% Extract current_state components, assigning them to appropriate letters.

A = current_state(1);
B = current_state(2);
E = current_state(3);
G = current_state(4);
L = current_state(5);
N = current_state(6);
O = current_state(7);
R = current_state(8);
T = current_state(9);

D = 5;  % This is a stated constraint of the problem.

powers_of_10 = [10^5,10^4,10^3,10^2,10,1]';

DONALD = [D,O,N,A,L,D]*powers_of_10;  % Find numbers equivalent to these names,
GERALD = [G,E,R,A,L,D]*powers_of_10;  % interpreting the letters as digits
ROBERT = [R,O,B,E,R,T]*powers_of_10;  % in a base 10 numerical representation.

if ((DONALD + GERALD) == ROBERT)      % Check whether this assignment
    solution_found = true;            % solves the problem.
    return;
else
    solution_found = false;
    return;
end

end
