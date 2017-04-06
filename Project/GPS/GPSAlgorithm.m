function [funcValues,x,ffc] = GPSAlgorithm(x0,delta0,maxiter,funcType,tau)


%% Initialization
delta = [delta0];      %% 1/4
%tau = .5;
epsStop = 1e-18;
G = [1,0;0,1];
Z = [1,0,-1,2,-1;0,1,-2,-2,0];
x = [x0];      %% [.6;.7]
D = G*Z;

DkSet = [];
% DkSet(:,:,1) =[D(:,4),D(:,2),D(:,3)];       %% if bk=4*deltak, p=1, where p is the part of D.
% DkSet(:,:,2) =[D(:,5),D(:,2),D(:,4)];       %% if bk!=4*deltak & ak=1, p=2
% DkSet(:,:,3) =[D(:,1),D(:,2),D(:,3)];       %% otherwise, p=3

%% Algorithm parameters
xk = x(:,1);
deltak = delta(1);
fk = functionsList(xk,funcType);
funcValues = [fk];
fc = 1;
ffc(fc) = fk;

%% Iteration Start
for k=1:maxiter
    %ak = xk(1);
    %bk = xk(2);
    mloFlag = true;
    
    %% Search Step
    % ------empty

    %% Poll Step
    [Dk] = findDk(length(xk));
    for i=1:size(Dk,2)
        t = xk + deltak*Dk(:,i);
        ft = functionsList(t,funcType);
        fc = fc+1;
        ffc(fc) = fk;
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
    fprintf("Iteration %d... fbest=%1.20f\n",k,fk);
    if (deltak < epsStop)
        break;
    end
end


end


%% Find the vectors of Dk according to the given conditions
% function[Dk,p] = findDk(ak,bk,deltak,DkSet)
%     if(bk==4*deltak)
%         Dk = DkSet(:,:,1);
%         p=1;
%     elseif(ak==1)
%         Dk = DkSet(:,:,2);
%         p=2;
%     else
%         Dk = DkSet(:,:,3);
%         p=3;
%     end
% end

%% choose Dk
function[Dk] = findDk(N)

if (N==2)
   Dk = [1,0;0,1;-1,0;0,-1;1,1;-1,1;1,-1;-1,-1]'; 
end

if (N==3)
   Dk = [1,0,0;0,1,0;0,0,1;-1,0,0;1,1,1;1,1,0;1,0,1;0,1,1;0,-1,0;0,0,-1;-1,-1,-1;]'; 
end

if (N==4)
   Dk = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;-1,0,0,0;0,-1,0,0;0,0,-1,0;0,0,0,-1;1,1,1,1;-1,-1,-1,-1]'; 
end
end