%% Function plot of Example 7.14
x = -100:1:100;
y=x;
[X,Y] = meshgrid(x,y);
f = [];

for i=1:size(X,1)
    for j=1:size(X,2)
        f(i,j) = function7_14(X(i,j),Y(i,j));
    end
end

figure, surf(X,Y,f)

%% Closer Plot
x=-.5:0.025:1;
[X2,Y2] = meshgrid(x,x);
f2 = [];

for i=1:size(X2,1)
    for j=1:size(X2,2)
        f2(i,j) = function7_14(X2(i,j),Y2(i,j));
    end
end

figure, surf(X2,Y2,f2)
title('Closer Plot')

%% Much Closer Plot
x=0.8:0.001:.9;
y=-0.01:0.0001:.01;
[X3,Y3] = meshgrid(x,y);
f3 = [];

for i=1:size(X3,1)
    for j=1:size(X3,2)
        f3(i,j) = function7_14(X3(i,j),Y3(i,j));
    end
end

figure, surf(X3,Y3,f3)
title('Much Closer Plot')