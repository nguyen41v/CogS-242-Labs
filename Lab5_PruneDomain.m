function [ domain, pruned ] = Lab5_PruneDomain( domain, constraint )

% This function prunes the given domain vector according to the given
% constraint vector, and sets the flag 'pruned' to true or false
% according to whether or not any values were pruned from the domain.
%
% Author: Alan P. Knoerr            Last Update: September 28, 2015

pruned_domain = domain(ismember(domain, constraint));

if ((length(pruned_domain) == length(domain)))
     pruned = false;
else
     domain = pruned_domain;
     pruned = true;
end

end

