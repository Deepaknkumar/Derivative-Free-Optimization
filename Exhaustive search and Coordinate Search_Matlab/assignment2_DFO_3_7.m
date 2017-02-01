numiter = 20;
init = [0,0];

%% complete polling
comPoll = [];
prevmin = fx1x2(init(1),init(2));
feval = [];
currPoint = init;
delta = 10;
comMindata = [];
comData = [];
newmin = prevmin;

for i=1:numiter
    feval(1,:) = fx1x2(currPoint(1)+delta,currPoint(2));  %e1 +x
    feval(2,:) = fx1x2(currPoint(1),currPoint(2)+delta);  %e2 +y
    feval(3,:) = fx1x2(currPoint(1)-delta,currPoint(2));  %e3 -x
    feval(4,:) = fx1x2(currPoint(1),currPoint(2)-delta);  %e4 -y
    
    for j=1:4
        if (feval(j,3) < prevmin(3)) 
            newmin = feval(j,:);
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

%% opportunistic polling
prevmin = fx1x2(init(1),init(2));
feval = [];
currPoint = init;
delta = 10;
comOppMindata = [];
comOppData = [];
newmin = prevmin;

comiter = 1;

for i=1:numiter    
    for j=1:4
        if (j==1)
            feval = fx1x2(currPoint(1)+delta,currPoint(2));  %e1 +x
        end
        if (j==2)
            feval = fx1x2(currPoint(1),currPoint(2)+delta);  %e2 +y
        end
        if (j==3)
            feval = fx1x2(currPoint(1)-delta,currPoint(2));  %e3 -x
        end
        if (j==4)
           feval = fx1x2(currPoint(1),currPoint(2)-delta);  %e4 -y
        end
        
        if (feval(3) < prevmin(3)) 
            newmin = feval;
            currPoint = [newmin(1),newmin(2)];
            break;
        end
        comOppData(comiter,:) = feval;
        comiter = comiter + 1;
    end
    
    if (newmin(3) >= prevmin(3))
        delta = delta/2;
    end
    
    comOppMindata(i,:) = newmin;
    prevmin = newmin;
end

%% Dynamic Polling
prevmin = fx1x2(init(1),init(2));
feval = [];
currPoint = init;
delta = 10;
comDynMindata = [];
comDynData = [];
newmin = prevmin;
newOrder = [1,2,3,4]; %% [+x,+y,-x-y]
comiter = 1;
for i=1:numiter    
    for j=1:4
        k = newOrder(j);
        if (k==1)
            feval = fx1x2(currPoint(1)+delta,currPoint(2));  %e1 +x
        end
        if (k==2)
            feval = fx1x2(currPoint(1),currPoint(2)+delta);  %e2 +y
        end
        if (k==3)
            feval = fx1x2(currPoint(1)-delta,currPoint(2));  %e3 -x
        end
        if (k==4)
           feval = fx1x2(currPoint(1),currPoint(2)-delta);  %e4 -y
        end
        
        if (feval(3) < prevmin(3)) 
            newmin = feval;
            currPoint = [newmin(1),newmin(2)];
            newOrder(1) = k;
            newOrder(k) = 1;
            break;
        end
        comDynData(comiter,:) = feval;
        comiter = comiter + 1;
    end
    
    if (newmin(3) >= prevmin(3))
        delta = delta/2;
    end
    
    comDynMindata(i,:) = newmin;
    prevmin = newmin;
end