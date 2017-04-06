%% Model based Descent Algorithm
function [funcValues,xValues,ffc] = MBDAlgorithm(x0,delta,maxiter,C,funcType)

%% Initialize
mu0 = .5;
eta = .1;
%epsd = .25;
epsStop = 1e-7;
k = 0;

%% Initial Parameters
continueAlgo = true;
%accurateModel = true;
%lsSuccess = true;
xk = x0;
muk = mu0;
np = 10;
funcValues = [];
xValues = [];
k = 1;
fk = functionsList(xk,funcType);
funcValues(k) = fk;
fc = 1;
ffc = [];
ffc(fc) = fk;
xValues(k,:) = xk';
%% Algorithm
while(k<maxiter)
    
    %% Model
    Y = pointGeneratorMBD(xk,delta,np,C);
    [alphas] = computeAlphaLR(Y,funcType);
    gk = alphas(2:end);
    ngk = norm(gk);
    
    %% Model Accuracy Checks
    if ((delta < epsStop) && ngk < epsStop)
        %continueAlgo = false;           %% It will break anyway
        fprintf("Stop Execution. delk = %1.20f, norm(gk) = %1.12f",delta,ngk);
        break;
    end
    
    if (delta > muk*ngk)
        fprintf("Model inaccurate! \n");
        delta = delta/2;
        continue;
    end
    
    if (delta <= muk*ngk)
        %accurateModel = true;
        fprintf("Model Accurate! \n");
    end
    
    
    %if (accurateModel)
        %% Line Search
        dk = -gk;       %% -gk will always satisfy descent direction parameter test.
        [lsSuccess,tau,fc,ffc] = FBTLineSearch(xk,dk,gk,eta,C,funcType,fc,ffc,fk);
        %[lsSuccess,tau] = ls(xk,dk,gk,eta,C,funcType);
        
        %% Update
        if(lsSuccess)
            fprintf("Line Search success!\n");
            xk = xk + tau*dk;
            xk = constraintCheck(xk,C);
        else
            fprintf("Line Search failed!\n");
            muk = muk/2;
        end
    %end
    k = k+1;
    xValues(k,:) = xk';
    fk = functionsList(xk,funcType);
    fc = fc +1;
    ffc(fc) = fk;
    funcValues(k) = fk;
    fprintf("Iteration %d .... gk = %f ,delk = %1.12f ,muk = %1.12f \n",k,ngk,delta,muk);
end
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