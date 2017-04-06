function[funcValues,xValues,Yk,ffc] = NMAlgorithm(Y0,maxIter,funcType)

%% Initialization
gamma = 1/2;        % Shrink Parameter
de = 2;             % expansion parameter
dic = -1/2;         % inside contraction parameter
doc = 1/2;          % outside contraction parameter
maxiter = maxIter;
tol = 1e-18;
fc = 0;
ffc = [];

%% Algorithm Parameters
funcValues = [];
xValues = [];
N = size(Y0,1);
fk = [];
for i=1:N+1
    fk(i) = functionsList(Y0(:,i),funcType);
    fc = fc+1;
    ffc(fc) = 1;
end
[fk,I] = sort(fk);
fkbest = fk(1);
ffc = fkbest.*ffc;
fkworst = fk(end);
Yk = Y0(:,I);


%% Algorithm
fprintf("Nelder Mead Algorithm Begins..... \n");
for k=1:maxiter
    fprintf("Iteration %d.... ",k);
    [isSimplex,detVal] = SimplexCheck(Yk);
    if(~isSimplex)
        fprintf("Yk is no longer a Simplex. Try again with different initial Simplex!\n")
       break; 
    end
    
    approxDiam = computeDiam(Yk);
    if (approxDiam) <= tol
        approxDiam
        fprintf("Approx Diameter is less than %1.12f . The Algorithm Stopped.\n",tol);
        break;
    end
    
%% Reflect
    yn = Yk(:,end);
    xc = (1/N)*sum(Yk(:,1:N),2);
    xr = xc + (xc-yn);
    fr = functionsList(xr,funcType);
    fc = fc+1;
    ffc(fc) = fkbest;
    if (fkbest <= fr && fr < fk(N))
        fprintf("Reflection Step Accepted! \n");
        Yk(:,end) = xr;
        fk(end) = fr;
    end


%% Expand
    if (fr < fkbest)
        xe = xc + de*(xc-yn);
        fe = functionsList(xe,funcType);
        fc = fc+1;
        ffc(fc) = fkbest;
        if (fe<fr)
            fprintf("Expansion Step Accepted! \n");
            Yk(:,end) = xe;
            fk(end) = fe;
        else
            fprintf("Reflection Step Accepted! \n");
            Yk(:,end) = xr;
            fk(end) = fr;
        end
    end

%% Outside Contraction
    if(fk(N) <= fr && fr < fkworst)
        xoc = xc + doc*(xc-yn);
        foc = functionsList(xoc,funcType);
        fc = fc+1;
        ffc(fc) = fkbest;
        if(foc<fr)
            fprintf("Outside Contraction Accepted! \n");
            Yk(:,end) = xoc;
            fk(end) = foc;
        else
            fprintf("Reflection Step Accepted! \n");
            Yk(:,end) = xr;
            fk(end) = fr;
        end
    end

%% Inside Contraction
    if(fr >= fkworst)
        xic = xc + dic*(xc-yn);
        fic = functionsList(xic,funcType);
        fc = fc+1;
        ffc(fc) = fkbest;
        if(fic<fk(end))
            fprintf("Inside Contraction Accepted! \n");
            Yk(:,end) = xic;
            fk(end) = fic;
        else
%% Shrink
            fprintf("Shrink Step!\n");
            y0 = Yk(:,1);
            for i=2:N+1
                Yk(:,i) = y0 + gamma*(Yk(:,i)-y0);
            end
            for i=1:N+1
                fk(i) = functionsList(Yk(:,i),funcType);
                fc = fc+1;
                ffc(fc) = fkbest;
            end
        end
    end
    
    %% Order
    [fk,I] = sort(fk);
    fkbest = fk(1);
    fkworst = fk(end);
    Yk = Yk(:,I);
    funcValues(k,:) = fk;
    xValues = [xValues;(Yk(:,1))'];
end

end