function [alphas] = computeAlphaLR(Y)
onesVec = ones(length(Y),1);
fy = function9_9(Y);

firstMP = [onesVec';Y]*[onesVec,Y'];
firstMPinv = inv(firstMP);
sMP = firstMPinv*[onesVec';Y];
alphas = sMP*fy;
end