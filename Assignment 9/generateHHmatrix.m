% The Function HouseHolder Matrix for any given vector v.
% The HouseHolder Matrix H is computed as follows:
%               H = I - 2*(v*v')/(norm(v)^2); 

function[HHmatrix] = generateHHmatrix(v)
HHmatrix = eye(length(v)) - 2*(v*v')/(norm(v)^2);
end