function[Ynew] = newSimplex(Yk,delta)
    Ynew = Yk;
    n = size(Yk,1);
    yn = Yk(:,end);
    xc = (1/n)*(sum(Yk(:,1:n),2));
    x = xc + delta*(xc-yn);
    Ynew(:,end) = x; 
end