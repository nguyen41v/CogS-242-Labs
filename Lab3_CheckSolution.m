function solution_found = Lab3_CheckSolution(current_state) %input is a list of numbers

% This function checks a possible solution for the crypt-arithmetic problem from Cog Sci 242, Lab 3.
% Returns true if the solution satisfies the solution certificate of DONALD + GERALD = ROBERT.
%
% Author: Vanessa Nguyen & Candy Shim        Last Update: September 18, 2018

%%%% Removed cause assume it's 0 
% Checking if T=0 because it will always be true for the solution.
%if not(current_state(9) == 0)
%    solution_found = false;
%    return %returns false and stops checking if T!=0 cause it can't be the solution
%end
    
    
% substitutes all the numbers for the letters
% This is how we substituted: 
%                                                        A B E G L N O R
% And these are the corresponding locations in the list: 1 2 3 4 6 7 8 9 
                           % D is always the number 5
                           % T is always the number 0
% Substitute numbers into equation: DONALD + GERALD = ROBERT, which is the
% solution certificate.
% If the solution is true, return true, else false
if (((5 * 10^5 + current_state(7) * 10^4 + current_state(6) * 10^3 + current_state(1) * 10^2 + current_state(5) * 10 + 5) + (current_state(4) * 10^5 + current_state(3) * 10^4 + current_state(8) * 10^3 + current_state(1) * 10^2 + current_state(5) * 10 + 5)) == (current_state(8) * 10^5 + current_state(7) * 10^4 + current_state(2) * 10^3 + current_state(3) * 10^2 + current_state(8) * 10))
    solution_found = true;
    return
end
% Solution not found, return false
solution_found = false;
end
    