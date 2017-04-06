%% Q10.9

%% Initial Parameters
xk = [0;2];
gk = [.5;4.5];
dk = -gk;

%% A) eta = .1;
eta = .1;
[lsSuccessA,tauA] = FBTLineSearch(xk,dk,gk,eta);

%% B) eta = .5;
eta = .5;
[lsSuccessB,tauB] = FBTLineSearch(xk,dk,gk,eta);

%% C) eta = .9;
eta = .9;
[lsSuccessC,tauC] = FBTLineSearch(xk,dk,gk,eta);