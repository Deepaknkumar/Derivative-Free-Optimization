%% Point Generation, N dimension grid into
function [Y] = pointGeneratorMBD(xk,delta,np,C)

N = length(xk);

Y = [];

if(N==1)
    [l1,u1] = contraintCheck(xk,delta,C);
    odp = l1:2*delta/np:u1; 
    Y = odp;
end

if (N==2)
    odp1 = xk(1)-delta:2*delta/np:xk(1)+delta; % one dimension points
    odp2 = xk(2)-delta:2*delta/np:xk(2)+delta; % one dimension points
    [X1,X2] = meshgrid(odp1,odp2);
    for i=1:size(X1,1)
        for j=1:size(X2,2)
            Y = [Y,[X1(i,j);X2(i,j)]];
        end
    end
end

if (N==3)
    [l1,u1] = constraintCheck(xk(1),delta,C(1,:));
    odp1 = l1:2*delta/np:u1;
    [l2,u2] = constraintCheck(xk(2),delta,C(2,:));
    odp2 = l2:2*delta/np:u2; 
    [l3,u3] = constraintCheck(xk(3),delta,C(3,:));
    odp3 = l3:2*delta/np:u3;
    
    [X1,X2,X3] = meshgrid(odp1,odp2,odp3);
    for i=1:size(X1,1)
        for j=1:size(X2,2)
            for k=1:size(X3,3)
                Y = [Y,[X1(i,j,k);X2(i,j,k);X3(i,j,k)]];
            end
        end
    end
end

if (N==4)
    [l1,u1] = constraintCheck(xk(1),delta,C(1,:));
    odp1 = l1:2*delta/np:u1;
    [l2,u2] = constraintCheck(xk(2),delta,C(2,:));
    odp2 = l2:2*delta/np:u2; 
    [l3,u3] = constraintCheck(xk(3),delta,C(3,:));
    odp3 = l3:2*delta/np:u3;
    [l4,u4] = constraintCheck(xk(4),delta,C(4,:));
    odp4 = l4:2*delta/np:u4;
    
    [U,V,W,X] = ndgrid(odp1,odp2,odp3,odp4);
    for i=1:size(U,1)
        for j=1:size(V,2)
            for k=1:size(W,3)
                for l=1:size(X,4)
                    Y = [Y,[U(i,j,k,l);V(i,j,k,l);W(i,j,k,l);X(i,j,k,l)]];
                end
            end
        end
    end
end

end

function [l,u] = constraintCheck(x,delta,c)
if (x-delta < c(1))
    l = c(1);
else
    l = x - delta;
end

if (x+delta > c(2))
    u = c(2);
else
    u = x + delta; 
end

end