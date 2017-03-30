function[funcValues,xValues] = NMAlgorithm(Y0)

%% Initialization
gamma = 1/2;        % Shrink Parameter
de = 2;             % expansion parameter
dic = -1/2;         % inside contraction parameter
doc = 1/2;          % outside contraction parameter
maxiter = 1000;

%% Algorithm Parameters
funcValues = [];
xValues = [];
N = size(Y0,1);
fk = [];
for i=1:N+1
    fk = fooFunction(Y0(:,i));
end
[fk,I] = sort(fk);
fkbest = fk(0);
fkworst = fk(end);
Yk = Y0(:,I);


%% Algorithm
for k=1:maxiter
    
%% Reflect
    yn = Yk(:,end);
    xc = (1/N)*sum(Yk(:,1:N),2);
    xr = xc + (xc-yn);
    fr = fooFunction(xr);
    
    if (fkbest <= fr && fr < fk(N-1))
        Yk(:,end) = xr;
        fk(end) = fr;
    end


%% Expand
    if (fr < fkbest)
        xe = xc + de*(xc-yn);
        fe = fooFunction(xe);
        if (fe<fr)
            Yk(:,end) = xe;
            fk(end) = fe;
        else
            Yk(:,end) = xr;
            fk(end) = fr;
        end
    end

%% Outside Contraction
    if(fk(N) <= fr && fr < fkworst)
        xoc = xc + doc*(xc-yn);
        foc = fooFunction(xoc);
        if(foc<fr)
            Yk(:,end) = xoc;
            fk(end) = foc;
        else
            Yk(:,end) = xr;
            fk(end) = fr;
        end
    end

%% Inside Contraction
    if(fr >= fkworst)
        xic = xc + dic*(xc-yn);
        fic = fooFunction(xic);
        if(fic<fk(end))
            Yk(:,end) = xic;
            fk(end) = fic;
        else
%% Shrink
            y0 = Yk(:,1);
            for i=2:N+1
                Yk(:,i) = y0 + gamma*(Yk(:,i)-y0);
            end
            
        end
    end
    
    %% Order
    [fk,I] = sort(fk);
    fkbest = fk(0);
    fkworst = fk(end);
    Yk = Yk(:,I);
    funcValues(k,:) = fk;
    xValues = [xValues;(Yk(:,1))']
end

end