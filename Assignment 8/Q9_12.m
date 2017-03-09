%% Q->9.12

%% Case 1:
delta0 = 1;
x0 = [1;2];
maxiter = 100;
[f1,x1] = GPSAlgorithm(x0,delta0,maxiter)

%% Case 2:
delta0 = 1/4;
x0 = [0;1/2];
maxiter = 100;
[f2,x2] = GPSAlgorithm(x0,delta0,maxiter)


%% Case 3:
delta0 = 1;
x0 = [1;1/2];
maxiter = 100;
[f3,x3] = GPSAlgorithm(x0,delta0,maxiter)