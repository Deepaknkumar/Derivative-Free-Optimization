% Test Vectors
Y1 = [0,.5,1];
Y2 = [.25,.5,.75];

% Expected outputs
alpha1 = 1.841470984807897;
alpha2 = 1.673737518956157;

%Preconditions

%% Test 1: Test for Vector Y1
alphas1 = computeAlphaLR(Y1);
assert(abs(alphas1(2)-alpha1)<= 1e-12," Test for Vector 1 Failed");

%% Test 2: Test for Vector Y2
alphas2 = computeAlphaLR(Y2);
assert(abs(alphas2(2)-alpha2)<= 1e-12," Test for Vector 1 Failed");