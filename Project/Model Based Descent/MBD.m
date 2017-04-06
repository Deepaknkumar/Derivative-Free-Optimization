function[funcValues,xValues] = MBD(x0,delta,maxiter,funcType)

%% Initialize
mu0 = .5;
eta = .1;
%epsd = .25;
epsStop = 1e-7;
k = 0;

%% Initial Parameters
xk = x0;
%delk = del0;
muk = mu0;
np = 10;
funcValues = [];
xValues = [];

while(k<maxiter)

    %% Model
    Y = pointGeneratorMBD(xk,delta,np);
    %Y = generateY(xk,np,delk,2);
    [alphas] = computeAlphaLR(Y,funcType);
    gk = alphas(2:end)
    ngk = norm(gk);
    
    %% Model Accuracy checks
    if(delta < epsStop && ngk < epsStop)
%         fprintf('success\n');
        break;
    end
    
    if(delta > muk*ngk)
%         fprintf('model is inaccurate;create the model again\n!');
        delta=delta/2;
        continue;
    end
    
    if(delta <= muk*ngk)
%         fprintf('model is accurate!\n');
    end

    %% Line Search -- Forward backward tracking line search
    Nmax=100;
    tau=1;
    dk=-gk;
    f1=functionsList(xk+tau*dk,funcType);
    f2=functionsList(xk,funcType) + eta*tau*(dk)'*gk;
    Nset=2.^(0:Nmax);
    if(f1<f2)
        line_success=true;
        for ii=1:Nmax
            tau=Nset(ii);
            if(functionsList(xk+tau*dk,funcType)>=functionsList(xk,funcType) + eta*tau*(dk)'*gk)
                break;
            end
        end
        tau=tau/2;
    else
        line_success=false;
        Nset=2.^(0:-1:-Nmax);
        for ii=1:Nmax
            tau=Nset(ii);
            if(functionsList(xk+tau*dk,funcType)<functionsList(xk,funcType) + eta*tau*(dk)'*gk)
                break;
            end
        end
        %             while(sum(Nset==tau)~=0&&func_eval(x+tau*dk',type)>=func_eval(x,type)+eta*tau*(dk)'*gk)
        %                 tau=tau/2;
        %             end
        if(functionsList(xk+tau*dk,funcType)<functionsList(xk,funcType) + eta*tau*(dk)'*gk)
            line_success=true;
        end
    end
    
    %% update
    if(line_success)
        xk=xk+tau*dk;
    else
        muk=muk/2;
    end
    
    k=k+1;
    xValues(k,:) = xk';
    funcValues(k)=functionsList(xk,funcType);
end


end