function [diam] = simplexDiam(Y)
    maxdiff = computeDistance(Y(:,1),Y(:,2));
    %%maxdiff = norm(Y(:,1)-Y(:,2),2);
    for i=1:size(Y,2)
        for j=i+1:size(Y,2)
            tmpdiff = computeDistance(Y(:,i),Y(:,j));
            %%tmpdiff = norm(Y(:,i)-Y(:,j),2);
            if (tmpdiff >= maxdiff)
                maxdiff = tmpdiff;
            end
        end
    end
diam = maxdiff;
end