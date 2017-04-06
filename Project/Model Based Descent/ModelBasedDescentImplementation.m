%% Model Based Descent Implementation of Project
format long;

%% 1. Rosenbrock function
fprintf("\n---------------------- Rosenbrock Function -----------------\n");
x0RB = [-1.2;1];
deltaRB = .1;
maxiter = 2000;
C =[-inf,inf;-inf,inf];
funcType = 'Rosenbrock';
[MBDfvRB,MBDxvRB,MBDffcRB] = MBDAlgorithm(x0RB,deltaRB,maxiter,C,funcType);
%NMfbestRB = fvRB(end,1)
MBDxbestRB = MBDxvRB(end,:)
MBDfbestRB = functionsList(MBDxbestRB,funcType)
results = table(MBDxbestRB)

%% 2. Cube function
fprintf("\n\n---------------------- Cube Function -----------------\n");
x0Cube = [-1.2;1];
deltaCube = .1;
maxiter = 2000;
C =[-inf,inf;-inf,inf];
funcType = 'Cube';
[MBDfvCube,MBDxvCube,MBDffcCube] = MBDAlgorithm(x0Cube,deltaCube,maxiter,C,funcType);
MBDxbestCube = MBDxvCube(end,:)
MBDfbestCube = functionsList(MBDxbestCube,funcType)
results = table(MBDfbestCube,MBDxbestCube)

%% 3. Beale function
fprintf("\n\n---------------------- Beale Function -----------------\n");
x0Beale = [.1,.1]';
deltaBeale = .5;
maxIter = 2000;
C =[-inf,inf;-inf,inf];
funcType = 'Beale';
[MBDfvBeale,MBDxvBeale,MBDffcBeale] = MBDAlgorithm(x0Beale,deltaBeale,maxIter,C,funcType);
MBDfbestBeale = MBDfvBeale(end)
MBDxbestBeale = MBDxvBeale(end,:)
results = table(MBDfbestBeale,MBDxbestBeale)

%% 4. Modified Box
fprintf("\n\n---------------------- Modified Box Function -----------------\n");
x0mBox = [0,10,20]';
deltamBox = .5;
maxIter = 2000;
C =[0,25;0,25;0,25];
funcType = 'ModifiedBox';
[MBDfvmBox,MBDxvmBox,MBDffcmBox] = MBDAlgorithm(x0mBox,deltamBox,maxIter,C,funcType);
MBDfbestmBox = MBDfvmBox(end)
MBDxbestmBox = MBDxvmBox(end,:)
results = table(MBDfbestmBox,MBDxbestmBox)

%% 5. Enzyme/Kowalik & Osborne I
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne I -----------------\n");
x0KO = [0,0,0,0]';
deltaKO = .1;
maxIter = 2000;
C = [0,1;0,1;0,1;0,1];
funcType = 'KowalikOsborne';
[MBDfvKO,MBDxvKO,MBDffcKO] = MBDAlgorithm(x0KO,deltaKO,maxIter,C,funcType);
MBDfbestKO = MBDfvKO(end)
MBDxbestKO = MBDxvKO(end,:)
results = table(MBDfbestKO,MBDxbestKO)

%% 6. Enzyme/Kowalik & Osborne II
fprintf("\n\n---------------------- Enzyme/Kowalik & Osborne II -----------------\n");
x0KO2 = [0.250,0.390,0.415,0.390]';
deltaKO2 = .5;
maxIter = 5000;
C = [0,1;0,1;0,1;0,1];
funcType = 'KowalikOsborne';
[MBDfvKO2,MBDxvKO2,MBDffcKO2] = MBDAlgorithm(x0KO2,deltaKO2,maxIter,C,funcType);
MBDfbestKO2 = MBDfvKO2(end)
MBDxbestKO2 = MBDxvKO2(end,:)
results = table(MBDfbestKO2,MBDxbestKO2)

%% 7. Powell Four Variable
fprintf("\n\n---------------------- Powell Four Variable -----------------\n");
x0p4v = [3,-1,0,1]';
deltap4v = .35;
maxIter = 5000;
C = [-inf,inf;-inf,inf;-inf,inf;-inf,inf];
funcType = 'Powell4Variable';
[MBDfvp4v,MBDxvp4v,MBDffcp4v] = MBDAlgorithm(x0p4v,deltap4v,maxIter,C,funcType);
MBDfbestp4v = MBDfvp4v(end)
MBDxbestp4v = MBDxvp4v(end,:)
results = table(MBDfbestp4v,MBDxbestp4v)

