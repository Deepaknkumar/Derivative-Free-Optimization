%% Forward-Backward-Tracking Line Search Algorithm
function[lsSuccess,tau,fc,ffc] = FBTLineSearch(xk,dk,gk,eta,C,funcType,fc,ffc,fk)

%% Initialization
tau = 1;        %% Initial Step length        
Nmax = 100;      %% Bound for evaluations

%% Initial Parameters
lsSuccess = true;
xk = constraintCheck(xk,C);
fxk = functionsList(xk,funcType);
fc = fc +1;
ffc(fc) = fk;
%fxk = function10_8(xk);
xkp = xk + tau*dk;
xkp = constraintCheck(xkp,C);
fkp = functionsList(xkp,funcType);
fc = fc +1;
ffc(fc) = fk;
%fkp = function10_8(xkp);
tauhset = 2.^(0:Nmax);
taulset = 2.^(-1*(0:Nmax));

%% Algorithm
if (fkp < fxk + computeWm(eta,tau,dk,gk))
    lsSuccess = true;
    for i=1:length(tauhset)
        tau = tauhset(i);
        xkp = constraintCheck(xk + tau*dk,C);
        fc = fc +1;
        ffc(fc) = fk;
        if (functionsList(xkp,funcType) >= functionsList(xk,funcType) + computeWm(eta,tau,dk,gk))
%        if (function10_8(xk + tau*dk) >= function10_8(xk) + computeWm(eta,tau,dk,gk))
            break;
        end
    end
    tau = tau/2;
else
    lsSuccess = false;
    for i=1:length(taulset)
        tau = taulset(i);
        xkp = constraintCheck(xk + tau*dk,C);
        fc = fc +1;
        ffc(fc) = fk;
        if (functionsList(xkp,funcType) < functionsList(xk,funcType) + computeWm(eta,tau,dk,gk))
%         if (function10_8(xk + tau*dk) < function10_8(xk) + computeWm(eta,tau,dk,gk))
            %tau = tmptau/2;
            break;
        end
    end
    xkp = constraintCheck(xk + tau*dk,C);
        fc = fc +1;
        ffc(fc) = fk;
    if (functionsList(xkp,funcType) < functionsList(xk,funcType) + computeWm(eta,tau,dk,gk))
%     if (function10_8(xk + tau*dk) < function10_8(xk) + computeWm(eta,tau,dk,gk))
        lsSuccess = true;
    end
end

end


%% Computation for addition term to f(xk)
function [Wm] = computeWm(eta,tau,dk,gk)
Wm = eta*tau*(dk')*gk;
end

function[cx] = constraintCheck(x,C)
cx = zeros(length(x),1);
for i=1:length(x)
    if (x(i) < C(i,1))
        cx(i) = C(i,1);
    elseif (x(i) > C(i,2))
        cx(i) = C(i,2);
    else
        cx(i) = x(i);
    end
end

end