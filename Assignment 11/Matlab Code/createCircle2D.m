function[coords] = createCircle2D(r,c)
    t = linspace(0,2*pi);
    x = r*cos(t) + c(1);
    y = r*sin(t) + c(2);
    %z = 0.*t;
    coords = [x;y];
end