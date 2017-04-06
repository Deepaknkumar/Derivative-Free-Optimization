function [isSimplex,detVal] = SimplexCheck(Y)
L = [];
isSimplex = true;

for i=2:size(Y,2)
   L = [L,Y(:,i)-Y(:,1)]; 
end

detVal = det(L);

if((detVal- (1e-12)) == 0)
    isSimplex = false;
end

end