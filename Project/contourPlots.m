%% contour Plots

%% 1. Rosenbrock function
fprintf("\n---------------------- Rosenbrock Function Contour -----------------\n");
funcType = 'Rosenbrock';
x = -1.2:.1:1.2;
y = -.3:.1:1.2;
[X,Y] = meshgrid(x,y);
Z = [];
for i=1:size(X,1)
    for j=1:size(Y,2)
        Z(i,j) = functionsList([X(i,j);Y(i,j)],funcType);
    end
end

figure, hold on
contour(X,Y,Z,2000)
plot3(NMxvRB(:,1),NMxvRB(:,2),zeros(length(NMxvRB(:,1)),1),'k','Linewidth',2)
plot3(GPSxvRB(1,:),GPSxvRB(2,:),zeros(length(GPSxvRB(1,:)),1),'r','Linewidth',2)
plot3(MBDxvRB(:,1),MBDxvRB(:,2),zeros(length(MBDxvRB(:,1)),1),'Linewidth',2) %'Color',[210/255 105/255 30/255]
plot(NMxvRB(1,1),NMxvRB(1,2),'*','Linewidth',7)
plot(NMxbestRB(1),NMxbestRB(2),'*','Linewidth',7)
plot(x0RB(1),x0RB(2),'*','Linewidth',7)
legend('Contours','Nelder Mead','GPS','MBD','NM x0','x*','x0','location','southwest')
title('Rosenbrock Function')
hold off

%% 2. Cube function
fprintf("\n---------------------- Cube Function Contour -----------------\n");
funcType = 'Cube';
x = -1.5:.1:1.2;
y = -2.5:.1:1.2;
[X,Y] = meshgrid(x,y);
Z = [];
for i=1:size(X,1)
    for j=1:size(Y,2)
        Z(i,j) = functionsList([X(i,j);Y(i,j)],funcType);
    end
end

figure, hold on
contour(X,Y,Z,2000)
plot3(NMxvCube(:,1),NMxvCube(:,2),zeros(length(NMxvCube(:,1)),1),'k','Linewidth',2)
plot3(GPSxvCube(1,:),GPSxvCube(2,:),zeros(length(GPSxvCube(1,:)),1),'r','Linewidth',2)
plot3(MBDxvCube(:,1),MBDxvCube(:,2),zeros(length(MBDxvCube(:,1)),1),'Linewidth',2) %'Color',[210/255 105/255 30/255]
plot(NMxvCube(1,1),NMxvCube(1,2),'*','Linewidth',7)
plot(NMxbestCube(1),NMxbestCube(2),'*','Linewidth',7)
plot(x0Cube(1),x0Cube(2),'*','Linewidth',7)
legend('Contours','Nelder Mead','GPS','MBD','NM x0','x*','x0','location','southeast')
title('Cube Function')
hold off

%% 2. Beale function
fprintf("\n---------------------- Beale Function Contour -----------------\n");
funcType = 'Beale';
x = -0.5:.1:3.1;
y = -1:.1:1;
[X,Y] = meshgrid(x,y);
Z = [];
for i=1:size(X,1)
    for j=1:size(Y,2)
        Z(i,j) = functionsList([X(i,j);Y(i,j)],funcType);
    end
end

figure, hold on
contour(X,Y,Z,2000)
plot3(NMxvBeale(:,1),NMxvBeale(:,2),zeros(length(NMxvBeale(:,1)),1),'k','Linewidth',2)
plot3(GPSxvBeale(1,:),GPSxvBeale(2,:),zeros(length(GPSxvBeale(1,:)),1),'r','Linewidth',2)
plot3(MBDxvBeale(:,1),MBDxvBeale(:,2),zeros(length(MBDxvBeale(:,1)),1),'Linewidth',2) %'Color',[210/255 105/255 30/255]
plot(NMxvBeale(1,1),NMxvBeale(1,2),'*','Linewidth',7)
plot(NMxbestBeale(1),NMxbestBeale(2),'*','Linewidth',7)
plot(x0Beale(1),x0Beale(2),'*','Linewidth',7)
legend('Contours','Nelder Mead','GPS','MBD','NM x0','x*','x0','location','southeast')
title('Beale Function')
hold off