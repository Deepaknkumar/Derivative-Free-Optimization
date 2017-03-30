%% Question 9.9
% Preconditions
format long;

%% Q 9.9 a) 11 points
Ya = 1:(3-1)/10:3;
alphasA = computeAlphaLR(Ya);
approxGradientA = alphasA(2)

%% Q 9.9 b) 101 points
Yb = 1:(3-1)/100:3;
alphasB = computeAlphaLR(Yb);
approxGradientB = alphasB(2)

%% Q 9.9 c) 1001 points
Yc = 1:(3-1)/1000:3;
alphasC = computeAlphaLR(Yc);
approxGradientC = alphasC(2)

%% True Gradient at xbar = 2.
xbar = 2;
trueGradientAt2 = 2*xbar.*cos(xbar.^2) + 1./(2.*sqrt(xbar))

%% Error Table
approxGradients = [approxGradientA;approxGradientB;approxGradientC];
errorValues = approxGradients - trueGradientAt2
Questions = ['A';'B';'C']; 
table(Questions,approxGradients,errorValues)