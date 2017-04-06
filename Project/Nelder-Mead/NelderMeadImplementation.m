%% Nelder Mead Implementation of Project
format long;

%% 1. Rosenbrock function
fprintf("\n---------------------- Rosenbrock Function -----------------\n");
Y0RB = [-1.2,1;0,-1;1,0]';
maxIter = 1000;
funcType = 'Rosenbrock';
[NMfvRB,NMxvRB,YfRB,NMffcRB] = NMAlgorithm(Y0RB,maxIter,funcType);
NMfbestRB = NMfvRB(end,1)
NMxbestRB = NMxvRB(end,:)
results = table(NMfbestRB,NMxbestRB)

%% 2. Cube function
fprintf("\n\n---------------------- Cube Function -----------------\n");
Y0Cube = [-1.2,1;0,-1;1,0]';
maxIter = 1000;
funcType = 'Cube';
[NMfvCube,NMxvCube,YfCube,NMffcCube] = NMAlgorithm(Y0Cube,maxIter,funcType);
NMfbestCube = NMfvCube(end,1)
NMxbestCube = NMxvCube(end,:)
results = table(NMfbestCube,NMxbestCube)

%% 3. Beale function
fprintf("\n\n---------------------- Beale Function -----------------\n");
Y0Beale = [.1,.1;0,-1;1,0]';
maxIter = 1000;
funcType = 'Beale';
[NMfvBeale,NMxvBeale,YfBeale,NMffcBeale] = NMAlgorithm(Y0Beale,maxIter,funcType);
NMfbestBeale = NMfvBeale(end,1)
NMxbestBeale = NMxvBeale(end,:)
results = table(NMfbestBeale,NMxbestBeale)

%% 4. Modified Box
fprintf("\n\n---------------------- Modified Box Function -----------------\n");
Y0mBox = [0,10,20;21,-1,0;-1,0,0;0,0,-1]';
%Y0mBox = rand(3,4);
maxIter = 10000;
funcType = 'ModifiedBox';
[NMfvmBox,NMxvmBox,YfmBox,NMffcmBox] = NMAlgorithm(Y0mBox,maxIter,funcType);
NMfbestmBox = NMfvmBox(end,1)
NMxbestmBox = NMxvmBox(end,:)
results = table(NMfbestmBox,NMxbestmBox)

%% 5. Enzyme/Kowalik & Osborne I
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne I -----------------\n");
Y0KO = [0,0,0,0;1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]';
maxIter = 1000;
funcType = 'KowalikOsborne';
[NMfvKO,NMxvKO,YfKO,NMffcKO] = NMAlgorithm(Y0KO,maxIter,funcType);
NMfbestKO = NMfvKO(end,1)
NMxbestKO = NMxvKO(end,:)
results = table(NMfbestKO,NMxbestKO)

%% 6. Enzyme/Kowalik & Osborne II
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne II -----------------\n");
Y0KO2 = [0.250,0.390,0.415,0.390;1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]';
maxIter = 1000;
funcType = 'KowalikOsborne';
[NMfvKO2,NMxvKO2,YfKO2,NMffcKO2] = NMAlgorithm(Y0KO2,maxIter,funcType);
NMfbestKO2 = NMfvKO2(end,1)
NMxbestKO2 = NMxvKO2(end,:)
results = table(NMfbestKO2,NMxbestKO2)

%% 7. Powell Four Variable
fprintf("\n\n---------------------- Powell Four Variable -----------------\n");
Y0p4v = [3,-1,0,1;1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]';
maxIter = 1000;
funcType = 'Powell4Variable';
[NMfvp4v,NMxvp4v,Yfp4v,NMffcp4v] = NMAlgorithm(Y0p4v,maxIter,funcType);
NMfbestp4v = NMfvp4v(end,1)
NMxbestp4v = NMxvp4v(end,:)
results = table(NMfbestp4v,NMxbestp4v)