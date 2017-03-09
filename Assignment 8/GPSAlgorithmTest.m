% Test output
x1_0 = [0;1];
delta1_0 = 1/4;
maxiter1 = 8;
x1_expected = [0,0.5,1,0,0,0,0,0,0.25;1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.25];

x2_0 = [0.6;0.7];
delta2_0 = 1/2;
maxiter2 = 100;
minf_expected = -0.0185;
% Preconditions
tol = 1e-6;

%% Test 1: Confirmation of first Eight Iterates
[f1,x1out] = GPSAlgorithm(x1_0,delta1_0,maxiter1);
assert(sum(sum((x1out-x1_expected)))<= tol,"First Eight iterated Failed!");

%% Test 2: Minimum Value
[f2,x2out] = GPSAlgorithm(x2_0,delta2_0,maxiter2);
assert((min(f2)-minf_expected)<= tol, "Minumum Value Case Falied!");