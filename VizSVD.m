function [ U,S,V ] = VizSVD( A )
%
%   This function displays an array of four related plots that reveal
%   the geometry of the singular value decomposition of the 2x2 real 
%   matrix A through its action on unit vectors.
%
%   It also returns that singular value decomposition, i.e. the matrices
%   U, S, and V such that U and V are orthogonal, S is diagonal,
%   and A = U*S*V'. This is computed by the Matlab function "svd."
%
%   Author: Alan P. Knoerr          Last Update: March 15, 2017

%   Compute the SVD of A.

[U,S,V]= svd(A);

%   Construct unit vectors as points on the unit circle.

theta = 0:pi/50:2*pi;
unit_x = cos(theta);
unit_y = sin(theta);
Unit_Vecs = [unit_x;unit_y];

%   Get x and y coordinates of the orthonormal eigenvectors of A'*A.

eig_x = V(1,:);
eig_y = V(2,:);

%   Apply V' to the unit vectors and the orthonormal eigenvectors.

Vt_Unit_Vecs = V'*Unit_Vecs;
vt_unit_x = Vt_Unit_Vecs(1,:);
vt_unit_y = Vt_Unit_Vecs(2,:);

Vt_Eig = V'*V;
vt_eig_x = Vt_Eig(1,:);
vt_eig_y = Vt_Eig(2,:);

%   Apply S to the V' processed vectors.

SVt_Unit_Vecs = S*Vt_Unit_Vecs;
svt_unit_x = SVt_Unit_Vecs(1,:);
svt_unit_y = SVt_Unit_Vecs(2,:);

SVt_Eig = S*Vt_Eig;
svt_eig_x = SVt_Eig(1,:);
svt_eig_y = SVt_Eig(2,:);

%   Apply U to the S*V' processed vectors.

USVt_Unit_Vecs = U*SVt_Unit_Vecs;
usvt_unit_x = USVt_Unit_Vecs(1,:);
usvt_unit_y = USVt_Unit_Vecs(2,:);

USVt_Eig = U*SVt_Eig;
usvt_eig_x = USVt_Eig(1,:);
usvt_eig_y = USVt_Eig(2,:);

% Construct the array of plots. The unit vectors are marked with blue
% circles. One eigenvector is marked with a green asterix, the other with a
% red asterix.

figure;

subplot(2,2,1);
plot(unit_x,unit_y,['.','b']);
daspect([1 1 1]);
hold;
plot([0,eig_x(1)],[0,eig_y(1)],['-','g'],[0,eig_x(2)],[0,eig_y(2)],['-','r']);
title(['X: Unit Circle, Right Singular Vectors of A']);

subplot(2,2,2);
plot(usvt_unit_x,usvt_unit_y,['.','b']);
daspect([1 1 1]);
hold;
plot([0,usvt_eig_x(1)],[0,usvt_eig_y(1)],['-','g'],[0,usvt_eig_x(2)],[0,usvt_eig_y(2)],['-','r']);
title('A*X = U*S*Vt*X');

subplot(2,2,3);
plot(vt_unit_x,vt_unit_y,['.','b']);
daspect([1 1 1]);
hold;
plot([0,vt_eig_x(1)],[0,vt_eig_y(1)],['-','g'],[0,vt_eig_x(2)],[0,vt_eig_y(2)],['-','r']);
title(['Vt*X']);

subplot(2,2,4);
plot(svt_unit_x,svt_unit_y,['.','b']);
daspect([1 1 1]);
hold;
plot([0,svt_eig_x(1)],[0,svt_eig_y(1)],['-','g'],[0,svt_eig_x(2)],[0,svt_eig_y(2)],['-','r']);
title('S*Vt*X');
end

