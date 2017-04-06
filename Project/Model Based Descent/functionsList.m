function [fx] = functionsList(x,caseType)
switch caseType
    case 'Rosenbrock'
        fx = RosenbrockFunction(x);
    case 'Cube'
        fx = CubeFunction(x);
    case 'Beale'
        fx = BealeFunction(x);
    case 'ModifiedBox'
        fx = modifiedBoxFunction(x);
    case 'KowalikOsborne'
        fx = KowalikOsborneFunction(x);
    case 'Powell4Variable'
        fx = Powell4VariableFunction(x);
    otherwise
        fx = [];
        warning('Unexpected Function Name. No Computation performed.')
end
end


function[fx] = RosenbrockFunction(x)
x1 = x(1);
x2 = x(2);
fx = 100*(x2-(x1^2))^2 + (1-x1)^2;
end


function[fx] = CubeFunction(x)
x1=x(1);
x2=x(2);
fx = 100*(x2-(x1^3))^2 + (1-x1)^2;
end


function[fx] = BealeFunction(x)
x1=x(1);
x2=x(2);
fx = (1.5 - x1*(1-x2))^2 + (2.25 - x1*(1-(x2^2)))^2 + (2.625 - x1*(1-(x2^3)))^2;
end


function[fx] = modifiedBoxFunction(x)
C = [0,25;0,25;0,25];
if (sum(x>=C(:,1)) == 3 &&  sum(x<=C(:,2)) == 3)
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    Q = .1*(1:10);
    fx = 0;
    for i=1:length(Q)
        y = Q(i);
        fx = fx + ((exp(-x1*y)-exp(-x2*y)) - x3*(exp(-y) - exp(-10*y)))^2;
    end
else
    fx = 1000000000000000000;
end
end


function [fx] = KowalikOsborneFunction(x)
C = [0,1;0,1;0,1;0,1];
if (sum(x>=C(:,1))== 4 &&  sum(x<=C(:,2)) == 4)
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);
    y = [0.1957,.1947,.1735,.1600,.0844,.0627,.0456,.0342,.0323,.0235,.0246];
    u = [4,2,1,.5,.25,.1670,.1250,.1,.0833,.0714,.0625];
    fx = 0;
    for i=1:length(y)
        fx = fx + (y(i) - ((x1*(u(i)^2 + u(i)*x2))/( u(i)^2 + u(i)*x3 + x4)))^2;
    end
else
    fx = 1000000000000000000;
end
end


function [fx] = Powell4VariableFunction(x)
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
fx = (x1 + 10*x2)^2 + 5*(x3-x4)^2 + (x2-2*x3)^4 + 10*(x1-x4)^4;
end