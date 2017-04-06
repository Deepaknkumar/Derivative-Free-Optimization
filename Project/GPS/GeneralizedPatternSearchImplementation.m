%% Generalized Pattern Search Implementation of Project
format long;

%% 1. Rosenbrock function
fprintf("\n---------------------- Rosenbrock Function -----------------\n");
x0GPS = [-1.2;1];
del0GPS = .1;
tau = 0.5;
maxiter = 1000;
funcType = 'Rosenbrock';
[GPSfvRB,GPSxvRB,GPSffcRB] = GPSAlgorithm(x0GPS,del0GPS,maxiter,funcType,tau);
GPSfbestRB = GPSfvRB(end)
GPSxbestRB = GPSxvRB(:,end)
%MBDfbestRB = functionsList(MBDxbestRB,funcType)
%results = table(GPSfbestRB,GPSxbestRB)

%% 2. Cube function
fprintf("\n\n---------------------- Cube Function -----------------\n");
x0Cube = [-1.2;1];
del0Cube = .1;
tau = .5;
maxiter = 1000;
funcType = 'Cube';
[GPSfvCube,GPSxvCube,GPSffcCube] = GPSAlgorithm(x0Cube,del0Cube,maxiter,funcType,tau);
GPSxbestCube = GPSxvCube(:,end)
GPSfbestCube = GPSfvCube(end)
results = table(GPSfbestCube,GPSxbestCube')

%% 3. Beale function
fprintf("\n\n---------------------- Beale Function -----------------\n");
x0Beale = [.1,.1]';
del0Beale = .5;
tau = .5;
maxIter = 1000;
funcType = 'Beale';
[GPSfvBeale,GPSxvBeale,GPSffcBeale] = GPSAlgorithm(x0Beale,del0Beale,maxIter,funcType,tau);
GPSfbestBeale = GPSfvBeale(end)
GPSxbestBeale = GPSxvBeale(:,end)
results = table(GPSfbestBeale,GPSxbestBeale')

%% 4. Modified Box
fprintf("\n\n---------------------- Modified Box Function -----------------\n");
x0mBox = [0,10,20]';
del0mBox = .5;
tau = .5;
maxIter = 1000;
funcType = 'ModifiedBox';
[GPSfvmBox,GPSxvmBox,GPSffcmBox] = GPSAlgorithm(x0mBox,del0mBox,maxIter,funcType,tau);
GPSfbestmBox = GPSfvmBox(end)
GPSxbestmBox = GPSxvmBox(:,end)
results = table(GPSfbestmBox,GPSxbestmBox')

%% 5. Enzyme/Kowalik & Osborne I
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne I -----------------\n");
x0KO = [0,0,0,0]';
del0KO = .1;
tau = 0.7;
maxIter = 1000;
funcType = 'KowalikOsborne';
[GPSfvKO,GPSxvKO,GPSffcKO] = GPSAlgorithm(x0KO,del0KO,maxIter,funcType,tau);
GPSfbestKO = GPSfvKO(end)
GPSxbestKO = GPSxvKO(:,end)
results = table(GPSfbestKO,GPSxbestKO')

%% 6. Enzyme/Kowalik & Osborne II
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne II -----------------\n");
x0KO2 = [0.250,0.390,0.415,0.390]';
del0KO2 = .5;
tau = .5;
maxIter = 1000;
funcType = 'KowalikOsborne';
[GPSfvKO2,GPSxvKO2,GPSffcKO2] = GPSAlgorithm(x0KO2,del0KO2,maxIter,funcType,tau);
GPSfbestKO2 = GPSfvKO2(end)
GPSxbestKO2 = GPSxvKO2(:,end)
results = table(GPSfbestKO2,GPSxbestKO2')

%% 7. Powell Four Variable
fprintf("\n\n---------------------- Powell Four Variable -----------------\n");
x0p4v = [3,-1,0,1]';
del0p4v = .35;
tau = .7;
maxIter = 1000;
funcType = 'Powell4Variable';
[GPSfvp4v,GPSxvp4v,GPSffcp4v] = GPSAlgorithm(x0p4v,del0p4v,maxIter,funcType,tau);
GPSfbestp4v = GPSfvp4v(end)
GPSxbestp4v = GPSxvp4v(:,end)
results = table(GPSfbestp4v,GPSxbestp4v')