function [LMatrix] = computeLMatrix(Y)
LMatrix = [];
    for i=2:size(Y,2)
        LMatrix = [LMatrix,Y(:,i)-Y(:,1)];
    end
end