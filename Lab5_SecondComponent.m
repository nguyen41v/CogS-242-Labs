function [ failure, Domain ] = Lab5_SecondComponent( Domain, parameters )

% This function establishes arc consistency in the second component of the 
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
% [failure, Constraint_C1] = Lab3_Constraint_C1(Comp2.L,Comp2.R,w)
% [failure, Constraint_C3] = Lab3_Constraint_C3(Comp2.B,Comp2.N,Comp2.R,x,y)
% [failure, Constraint_C5] = Lab3_Constraint_C5(Comp2.G,Comp2.R,z)
% [domain, pruned_flag] = Lab5_PruneDomain(domain,constraint)
% failure = Lab5_NotEqualConstraints(U)
%
% Author: Alan P. Knoerr               Last Upate: September 28, 2015

% Extract the second component from 'Domain' and values from 'parameters.'
% Note that all of the domains for this component start out being the same.

v = Domain.B;     % common initial domain

Comp2 = struct('B',v,'G',v,'L',v,'N',v,'R',v);

w = parameters(1);
x = parameters(2);
y = parameters(3);
z = parameters(4);

Var_Names = fieldnames(Comp2);   % Var_Names is a cell array of variable names 
n_Names = length(Var_Names);

% Remove any values uniquely assigned to the first component from second component domains.
% by first collecting any singletons from the first component into the vector U,

U = [];
      
if (length(Domain.A) == 1)
  U = horzcat( U, Domain.A);
end

if (length(Domain.E) == 1)
  U = horzcat( U, Domain.E);
end

% and then removing these values from the second component domains.

for i = 1:n_Names
   Comp2.(Var_Names{i}) = Comp2.(Var_Names{i})( not(ismember(Comp2.(Var_Names{i}),U)));
end

% Set "pruned" flags.

t = true;
pruned = struct('B',t,'G',t,'L',t,'N',t,'R',t,'R1',t,'R3',t,'R5',t);

while ( pruned.B || pruned.G || pruned.L || pruned.N || pruned.R )
    
    % Prune the variables in the scope of Constraint C1
    % by updating constraint C1: set failure = true and return if not possible

    [failure, Constraint_C1] = Lab3_Constraint_C1(Comp2.L,Comp2.R,w);

    if (failure == true)
        return
    end
    
    % and then pruning the domains of L and R.

    [Comp2.L, pruned.L] = Lab5_PruneDomain(Comp2.L, Constraint_C1(:,1));
    [Comp2.R, pruned.R1] = Lab5_PruneDomain(Comp2.R, Constraint_C1(:,2));
    
    % Prune variables in the scope of Constraint C5
    % by updating constraint C5: set failure = true and return if not possible

    [failure, Constraint_C5] = Lab3_Constraint_C5(Comp2.G,Comp2.R,z);

    if (failure == true)
        return
    end
    
    % and then pruning the domains of G and R.

    [Comp2.G, pruned.G] = Lab5_PruneDomain(Comp2.G, Constraint_C5(:,1));
    [Comp2.R, pruned.R5] = Lab5_PruneDomain(Comp2.R, Constraint_C5(:,2));
    
    % Prune variables in the scope of Constraint C3, by
    % updating constraint C3: set failure = true and return if not possible

    [failure, Constraint_C3] = Lab3_Constraint_C3(Comp2.B,Comp2.N,Comp2.R,x,y);

    if (failure == true)
        return
    end
    
    % and then pruning the domains of B, N and R.

    [Comp2.B, pruned.B] = Lab5_PruneDomain(Comp2.B, Constraint_C3(:,1));
    [Comp2.N, pruned.N] = Lab5_PruneDomain(Comp2.N, Constraint_C3(:,2));
    [Comp2.R, pruned.R3] = Lab5_PruneDomain(Comp2.R, Constraint_C3(:,3));
    
    % Determine whether the domain of R was pruned at all on this pass.

    pruned.R = pruned.R1 || pruned.R5 || pruned.R3;
    
end

% Check "not equal" constraints for singleton domains in the second component
% by first collecting the singletons into the vector U,

U = [];
      
for i = 1:n_Names
    if length( Comp2.(Var_Names{i}) ) == 1
       U = horzcat( U, Comp2.(Var_Names{i}) );
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
    Domain.(Var_Names{i}) = Comp2.(Var_Names{i});
end

end

