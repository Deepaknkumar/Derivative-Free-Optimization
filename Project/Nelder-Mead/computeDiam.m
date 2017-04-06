function[approxDiam] = computeDiam(Y)
%%% Computes Approximate Diameter
normvec = [];
normvec(1) = 0;
for i=2:size(Y,2)
    normvec(i) = norm(Y(:,i)-Y(:,1));
end
[approxDiam,I] = max(normvec);
end