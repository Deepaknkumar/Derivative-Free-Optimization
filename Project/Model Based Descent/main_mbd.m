clc;
clear all;
%% Initialization
mu0=0.5; %starting accuracy parameter
eta=0.1; %armijo parameter
% epd=1;%descent direction test parameter
ep_stop=10^-7; %stopping tollerance
k=0;
tt=1;
p_no=1;
n=10;% number of points created around center
domain=[-Inf Inf;-Inf Inf;-Inf Inf;0 25;0 1;0 1;-Inf Inf];
if p_no==1
    x0=[-1.2 1];
    delta0=0.1;
    xs=[1 1];
    type='ros';
    dim=2;
elseif p_no==2
    x0=[-1.2 1];
    xs=[1 1];
    delta0=0.1;
    type='cube';
    dim=2;
elseif p_no==3
    x0=[0.1 0.1];
    delta0=0.5;
    xs=[3 0.5];
    type='baele';
    dim=2;
elseif p_no==4
    x0=[0 10 20];
    xs=[1 10 1];
    delta0=0.5;
    type='modbox';
    dim=3;
elseif p_no==5
    x0=[0 0 0 0];
    delta0=0.1;
    xs=[0.192833 0.190836 0.123117 0.135766];
    type='enzyme';
    dim=4;
elseif p_no==6
    x0=[0.25 0.39 0.415 0.39];
    delta0=0.5;
    type='enzyme';
    xs=[0.192833 0.190836 0.123117 0.135766];
    dim=4;
elseif p_no==7
    x0=[3 -1 0 1];
    delta0=0.35;
    type='powell';
    xs=[0 0 0 0];
    dim=4;
end
x=x0;
model_success=true;
Delta=delta0;
 fs=func_eval(xs,type);
while(k<10000)
    %% 1- Model
    Ym=generateY(x,n,Delta,dim);
    Ym=domain_fixer(Ym,domain,p_no);
    Y=[ones([1 size(Ym,1)]); Ym'];
    YY=pinv(Y*Y')*Y;
    ZZ=(func_eval(Ym,type));
    alphas=YY*ZZ;
    gk=alphas(2:end);
    %% Model Accuracy check
    ngk=norm(gk);
    if(Delta<ep_stop&&ngk<ep_stop)
%         fprintf('success\n');
        break;
    end
    if(Delta>mu0*ngk)
%         fprintf('model is inaccurate;create the model again\n!');
        Delta=Delta/2;
        continue;
    end
    if(Delta<=mu0*ngk)
%         fprintf('model is accurate!\n');
    end
    %% Line Search -- Forward backward tracking line search
    Nmax=100;
    tau=1;
    dk=-gk;
    f1=func_eval(x+tau*dk',type);
    f2=func_eval(x,type)+eta*tau*(dk)'*gk;
    Nset=2.^(0:Nmax);
    if(f1<f2)
        
        line_success=true;
        for ii=1:Nmax
            tau=Nset(ii);
            if(func_eval(x+tau*dk',type)>=func_eval(x,type)+eta*tau*(dk)'*gk)
                break;
            end
        end
        %             while(sum(Nset==tau)~=0&&
        %                 tau=tau*2;
        %             end
        tau=tau/2;
    else
        line_success=false;
        Nset=2.^(0:-1:-Nmax);
        for ii=1:Nmax
            tau=Nset(ii);
            if(func_eval(x+tau*dk',type)<func_eval(x,type)+eta*tau*(dk)'*gk)
                break;
            end
        end
        %             while(sum(Nset==tau)~=0&&func_eval(x+tau*dk',type)>=func_eval(x,type)+eta*tau*(dk)'*gk)
        %                 tau=tau/2;
        %             end
        if(func_eval(x+tau*dk',type)<func_eval(x,type)+eta*tau*(dk)'*gk)
            line_success=true;
        end
    end
    
    %% update
    if(line_success)
        xk=domain_fixer(x+tau*dk',domain,p_no);
        x=xk;
        f_final(tt)=func_eval(x,type);
        tt=tt+1;
    else
        mu0=mu0/2;
    end
    
    k=k+1;
end
plot(log(f_final))
% while
% end