%% ----------- Parameters ---------%%
deltaR = 1;
deltaE = 2;
deltaIC = -0.5;
deltaOC = 0.5;
resol = .01;
%%-------------------------------%%

%% ---------------------- Computations --------------------------------- 
vol0 = [];
volE = [];
volIC = [];
volOC = [];
volR = [];
diam0 = [];
diamE = [];
diamIC = [];
diamOC = [];
diamR = [];
von0 = [];
vonE = [];
vonIC = [];
vonOC = [];
vonR = [];

thetaVec = resol:resol:(pi/2)-resol;
for i=1:length(thetaVec)
    
    Y = createSimplexq5_9(thetaVec(i));
    YR = newSimplex(Y,deltaR);
    YE = newSimplex(Y,deltaE);
    YIC = newSimplex(Y,deltaIC);
    YOC = newSimplex(Y,deltaOC);
    
    L = computeLMatrix(Y);      %%LMatrices for computation of determinant
    LE = computeLMatrix(YE);
    LIC = computeLMatrix(YIC);
    LOC = computeLMatrix(YOC);
    LR = computeLMatrix(YR);
    
    vol0 =[vol0,[thetaVec(i);simplexVol(L)]];       %% Volume computations
    volE =[volE,[thetaVec(i);simplexVol(LE)]];
    volIC =[volIC,[thetaVec(i);simplexVol(LIC)]];
    volOC =[volOC,[thetaVec(i);simplexVol(LOC)]];
    volR = [volR,[thetaVec(i);simplexVol(LR)]]; 
    
    diam0 = [diam0,[thetaVec(i);simplexDiam(Y)]];         %% Diameter Computation
    diamE = [diamE,[thetaVec(i);simplexDiam(YE)]];
    diamIC = [diamIC,[thetaVec(i);simplexDiam(YIC)]];
    diamOC = [diamOC,[thetaVec(i);simplexDiam(YOC)]];
    diamR = [diamR,[thetaVec(i);simplexDiam(YR)]];
end

n = size(L,1);
for i=1:length(thetaVec)
    von0 = [von0,[thetaVec(i);simplexNormalizedVolume(vol0(2,i),diam0(2,i),n)]];
    vonE = [vonE,[thetaVec(i);simplexNormalizedVolume(volE(2,i),diamE(2,i),n)]];
    vonIC = [vonIC,[thetaVec(i);simplexNormalizedVolume(volIC(2,i),diamIC(2,i),n)]];
    vonOC = [vonOC,[thetaVec(i);simplexNormalizedVolume(volOC(2,i),diamOC(2,i),n)]];
    vonR = [vonR,[thetaVec(i);simplexNormalizedVolume(volR(2,i),diamR(2,i),n)]];
end


%% a) 
figure,
plot(von0(1,:),von0(2,:),'linewidth',2);
hold on
plot(vonR(1,:),vonR(2,:),'*');
xlabel('Theta');
ylabel('Normalized Volume');
title('Normalized Volume of Simple Vs Theta');
legend('von(Y0)','von(Yr)');
hold off

%% Volume Plot
figure,
plot(vol0(1,:),vol0(2,:))
hold on
plot(volE(1,:),volE(2,:),'m')
plot(volIC(1,:),volIC(2,:),'g -o')
plot(volOC(1,:),volOC(2,:),'k')
hold off
title('Simplex Volume Vs varying angles');
xlabel('Value of theta (0,pi/2)');
ylabel('Volume of the Simplex');
legend('Reflected','Expanded','Inner Contraction','Outer Contraction')


%% Diameter plot
figure,
plot(diam0(1,:),diam0(2,:))
hold on
plot(diamE(1,:),diamE(2,:),'m')
plot(diamIC(1,:),diamIC(2,:),'g -o')
plot(diamOC(1,:),diamOC(2,:),'k')
hold off
title('Simplex Diameter Vs varying angles');
xlabel('Value of theta (0,pi/2)');
ylabel('Diameter of the Simplex');
legend('Reflected','Expanded','Inner Contraction','Outer Contraction')

%% Normalized Volume plot
figure,
plot(von0(1,:),von0(2,:),'-^','linewidth',2)
hold on
plot(vonE(1,:),vonE(2,:),'m -x','linewidth',2)
plot(vonIC(1,:),vonIC(2,:),'g -o','Markersize',10)
plot(vonOC(1,:),vonOC(2,:),'k','linewidth',2)
hold off
title('Simplex Volume Vs varying angles');
xlabel('Value of theta (0,pi/2)');
ylabel('Volume of the Simplex');
legend('Reflected','Expanded','Inner Contraction','Outer Contraction')