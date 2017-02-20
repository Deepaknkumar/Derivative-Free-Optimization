function[y] = gx1x2(x1,x2,Rtheta)
x = Rtheta*[x1;x2];
gx = max(abs(x));
y = [x1,x2,gx];
end