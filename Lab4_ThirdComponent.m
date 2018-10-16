function [Domain] = Lab4_ThirdComponent(Domain)

% This function identifies the domain values which have already been
% assigned to other variables and removes them from the domain of the
% variable O.
%
% Author: Vannesa Nguyen & Candy Shim       Last Update: September 25, 2018

% Check if variable domains have only one value.
% If the variable domain only has one value, remove the value from domain 
% of O. 

if (length(Domain.A) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.A)));
end

if (length(Domain.B) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.B)));
end

if (length(Domain.E) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.E)));
end

if (length(Domain.G) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.G)));
end

 if (length(Domain.L) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.L)));
end

if (length(Domain.N) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.N)));
end

if (length(Domain.R) == 1)
    Domain.O = Domain.O(not(ismember(Domain.O,Domain.R)));
end
end