function [p] = compute_p(R,U,ploticon)
G = 1;
Z = [-1,U];
D = G*Z;
x0 = 0;
delta = 1;

a = -R:R;
b = -R:R;

p = -a + b*U;

figure,plot(p,zeros(length(a),1),ploticon)
Rstring = num2str(R);
titlehead = strcat('Plot for R = ',Rstring, ' and U =',num2str(U));
title(titlehead)
end