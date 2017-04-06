
mx = -2:.1:2;
[X,Y] = meshgrid(mx,mx);
F = [];

for i=1:size(X,1)
   for j=1:size(X,2)
       F(i,j) = functionsList([X(i,j),Y(i,j)],'Rosenbrock');
   end
end