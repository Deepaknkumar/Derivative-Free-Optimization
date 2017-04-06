%% Q10.11

%% Initial Parameters
eta = 1/2;
xbar = [1;1];

%% Part b)
delta = .1;
gk = 2*xbar +[delta;-delta];
dk = -gk;
tbar = (8/((delta+2)^2 + (2-delta)^2)) - 1/2;
tval = 0:.05:2*tbar;

Ltval = [];
Lntval = [];
Ldntval = [];
fxbarpval = [];

for i=1:length(tval)
t = tval(i);
Ltval(i) = computeLt(t,xk,dk);
Lntval(i) = computeLnt(t,xk,eta,dk);
Ldntval(i) = computeLdnt(t,xk,eta,dk,gk);
fxbarpval(i) = computefxbarp(t,xk,dk);
end

figure, hold on
plot(Ltval,'Linewidth',2)
plot(Lntval,'Linewidth',2)
plot(Ldntval,'Linewidth',2)
plot(fxbarpval,'Linewidth',2)
legend('Lt','Lnt','Ldnt','fxbar')
xlabel('Values of t')
ylabel('Function Values')
title('Plot for delta = 0.1');
hold off

%% Part c)
delta = .01;
gk = 2*xbar +[delta;-delta];
dk = -gk;
tbar = (8/((delta+2)^2 + (2-delta)^2)) - 1/2;
tval = 0:.005:2*tbar;

Ltval = [];
Lntval = [];
Ldntval = [];
fxbarpval = [];

for i=1:length(tval)
t = tval(i);
Ltval(i) = computeLt(t,xk,dk);
Lntval(i) = computeLnt(t,xk,eta,dk);
Ldntval(i) = computeLdnt(t,xk,eta,dk,gk);
fxbarpval(i) = computefxbarp(t,xk,dk);
end

figure, hold on
plot(Ltval,'Linewidth',2)
plot(Lntval,'Linewidth',2)
plot(Ldntval,'Linewidth',2)
plot(fxbarpval,'Linewidth',2)
legend('Lt','Lnt','Ldnt','fxbar')
xlabel('Values of t')
ylabel('Function Values')
title('Plot for delta = 0.01');
hold off

%% ----------------------------------------------------------------------%%

function[gx] = computeGrad(x)
gx = 2*x;
end

function[Lt] = computeLt(t,xk,dk)
delF = computeGrad(xk);
fxk = func10_11(xk);
Lt = fxk + t*(dk')*delF;
end

function[Lnt] = computeLnt(t,xk,eta,dk)
delF = computeGrad(xk);
fxk = func10_11(xk);
Lnt = fxk + eta*t*(dk')*delF;
end

function[Ldnt] = computeLdnt(t,xk,eta,dk,gk)
fxk = func10_11(xk);
Ldnt = fxk + eta*t*(dk')*gk;
end

function[fxbarp] = computefxbarp(t,xk,dk)
fxbarp = func10_11(xk + t*dk);
end