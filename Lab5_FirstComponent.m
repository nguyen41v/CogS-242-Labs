function [ failure, Domain ] = Lab5_FirstComponent( Domain, parameters )

% This function establishes arc consistency in the first component of the 
% constraint network for the DONALD + GERALD = ROBERT cyrptarithmetic 
% problem (as described in the Lab 4 handout), if this can be done
% with the nuisance parameter values in 'parameters'.
%
% If successful, it sets the 'failure' flag to 'false' and   
% outputs 'Domain' with the arc consistent second component.
% Otherwise, it sets the 'failure' flag to 'true' and outputs the same
% 'Domain' it was given.
%
% See the Lab 5 handout for further details.
%
% This function calls the following functions with the indicated syntax:
%
% [failure, Constraint_C2] = Lab3_Constraint_C2(Comp1.A,Comp1.E,w,x)
% [failure, Constraint_C4] = Lab3_Constraint_C4(Comp1.E,y,z)
% [domain, pruned_flag] = Lab5_PruneDomain(domain,constraint)
% failure = Lab5_NotEqualConstraints(U)
%
% Author: Vanessa Nguyen & Candy Shim        Last Upate: October 2, 2018

% Extract the first component from 'Domain' and values from 'parameters.'
% Note that all of the domains for this component start out being the same.

v = Domain.A;     % common initial domain

Comp1 = struct('A',v,'E',v);

w = parameters(1);
x = parameters(2);
y = parameters(3);
z = parameters(4);

Var_Names = fieldnames(Comp1);   % Var_Names is a cell array of variable names 
n_Names = length(Var_Names);

% Set "pruned" flags.

t = true;
pruned = struct('A',t,'E',t,'E2',t,'E4',t);

while ( pruned.A || pruned.E )
    
    % Prune the variable E in the scope of Constraint C4 by updating 
    % constraint C4: set failure = true and return if not possible
    
    [failure, Constraint_C4] = Lab3_Constraint_C4(Comp1.E,y,z);
    if (failure == true)
        return
    end
    
    % Then prune the domain of E.
    
    [Comp1.E, pruned.E4] = Lab5_PruneDomain(Comp1.E, Constraint_C4(:,1));

    
    %Prune the variables in the scope of Constraint C2 by first updating
    %constraint C2: set failure = true and reutrn if not possible.
    
    [failure, Constraint_C2] = Lab3_Constraint_C2(Comp1.A,Comp1.E,w,x);
    if (failure == true)
        return
    end
    
    % Then prune the domain of A and E (in principle). 
    
    [Comp1.E, pruned.E2] = Lab5_PruneDomain(Comp1.E, Constraint_C2(:,2));
    [Comp1.A, pruned.A] = Lab5_PruneDomain(Comp1.A, Constraint_C2(:,1));
    
    %Determine whether the domain of E was pruned at all on this pass. 
    
    pruned.E = pruned.E2 || pruned.E4;

    
end

% Check "not equal" constraints for singleton domains in the first component
% by first collecting the singletons into the vector U,

U = [];
      
for i = 1:n_Names
    if length( Comp1.(Var_Names{i}) ) == 1
       U = horzcat( U, Comp1.(Var_Names{i}) );
    end
end

% then checking the "not equal" constraints.

failure = Lab5_NotEqualConstraints(U); 
  
if (failure == true)
   return
end
    
% If you get this far, arc consistency has been achieved for this component.
% Update Domain with this consistent second component.

for i = 1:n_Names
    Domain.(Var_Names{i}) = Comp1.(Var_Names{i});
end

end

