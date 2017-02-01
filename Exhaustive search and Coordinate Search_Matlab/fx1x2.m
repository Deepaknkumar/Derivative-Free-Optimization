function[y] = fx1x2(x1,x2)
val = exp(-x1) + x2;
y = [x1,x2,val];
end