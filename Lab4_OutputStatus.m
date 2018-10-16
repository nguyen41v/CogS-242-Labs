function []= Lab4_OutputStatus(Domain)

% This function checks the pruned Domain to see if there is only one value
% in each domain.
% It will display a message saying whether or not a solution is found.

% Author: Vannesa Nguyen & Candy Shim       Last Update: September 25, 2018

% Check if there are more than one value in each domain. If there is more
% than 1 value, display "A solution has not been found."

if (length(Domain.A) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.B) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.E) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.G) > 1)
    disp('A solution has not been found')
    return
end

 if (length(Domain.L) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.N) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.R) > 1)
    disp('A solution has not been found')
    return
end

if (length(Domain.O) > 1)
    disp('A solution has not been found')
    return
end

% All domains have one value, a solution has been found. 

% Display "A solution has been found."
disp('A solution has been found')
end