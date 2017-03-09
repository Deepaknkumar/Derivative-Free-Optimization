function [funcValues,x] = GPSAlgorithm(x0,delta0,maxiter)


%% Initialization
delta = [delta0];      %% 1/4
tau = 1/2;
epsStop = 1e-6;
G = [1,0;0,1];
Z = [1,0,-1,2,-1;0,1,-2,-2,0];
x = [x0];      %% [.6;.7]
D = G*Z;

DkSet = [];
DkSet(:,:,1) =[D(:,4),D(:,2),D(:,3)];       %% if bk=4*deltak, p=1, where p is the part of D.
DkSet(:,:,2) =[D(:,5),D(:,2),D(:,4)];       %% if bk!=4*deltak & ak=1, p=2
DkSet(:,:,3) =[D(:,1),D(:,2),D(:,3)];       %% otherwise, p=3

%% Algorithm parameters
xk = x(:,1);
deltak = delta(1);
fk = function7_14(xk(1),xk(2));
funcValues = [fk];

%% Iteration Start
for k=1:maxiter
    ak = xk(1);
    bk = xk(2);
    mloFlag = true;
    
    %% Search Step
    % ------empty

    %% Poll Step
    [Dk,pc] = findDk(ak,bk,deltak,DkSet);
    for i=1:size(Dk,2)
        t = xk + deltak*Dk(:,i);
        ft = function7_14(t(1),t(2));
        if (ft<fk)
            fk=ft;
            mloFlag = false;
            xk = t;
            deltak = deltak/tau;
            break;
        end
    end
    
    if(mloFlag)
        deltak = deltak*tau;
    end
    
    funcValues(k+1) = fk;
    x = [x,xk];
end


end


%% Find the vectors of Dk according to the given conditions
function[Dk,p] = findDk(ak,bk,deltak,DkSet)
    if(bk==4*deltak)
        Dk = DkSet(:,:,1);
        p=1;
    elseif(ak==1)
        Dk = DkSet(:,:,2);
        p=2;
    else
        Dk = DkSet(:,:,3);
        p=3;
    end
end