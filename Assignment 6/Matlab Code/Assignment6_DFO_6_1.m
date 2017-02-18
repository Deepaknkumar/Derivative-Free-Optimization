numiter = 10;
init = [1,1];
theta = pi/8;
Rtheta = compute_Rtheta(theta);

%complete polling
prevmin = gx1x2(init(1),init(2),Rtheta);
feval = [];
currPoint = init;
delta = 1;
comMindata = [];
comData = [];
newmin = prevmin;

for i=1:numiter
    feval(1,:) = gx1x2(currPoint(1)+delta,currPoint(2),Rtheta);  %e1 +x
    feval(2,:) = gx1x2(currPoint(1),currPoint(2)+delta,Rtheta);  %e2 +y
    feval(3,:) = gx1x2(currPoint(1)-delta,currPoint(2),Rtheta);  %e3 -x
    feval(4,:) = gx1x2(currPoint(1),currPoint(2)-delta,Rtheta);  %e4 -y
    
    for j=1:4
        if (feval(j,3) < prevmin(3)) 
            newmin = feval(j,:)
        end
        comData(4*(i-1)+j,:) = feval(j,:);
    end
    
    if (newmin(3) < prevmin(3))
        currPoint = [newmin(1),newmin(2)];
    else
        delta = delta/2;
    end
    
    comMindata(i,:) = newmin;
    prevmin = newmin;
end