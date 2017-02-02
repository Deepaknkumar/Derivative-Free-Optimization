function[vol] = simplexVol(LMatrix)
    detL = det(LMatrix);
    vol = abs(detL)/factorial(size(LMatrix,1));
end
