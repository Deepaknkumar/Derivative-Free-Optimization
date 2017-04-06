function [alphas] = computeAlphaLR(Y,funcType)
onesVec = ones(size(Y,2),1);
fy = [];

for i=1:size(Y,2)
    x = Y(:,i);
    fy(i) = functionsListfm(x,funcType);
end

firstMP = [onesVec';Y]*[onesVec,Y'];
firstMPinv = pinv(firstMP);
sMP = firstMPinv*[onesVec';Y];
alphas = sMP*fy';
end