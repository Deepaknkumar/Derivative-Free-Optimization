%% Example 7.14 Function

function[f] = function7_14(a,b)
    p1 = (b^2)*((a-1)^2 + 2);
    p2 = 2*((max([b-a,0]))^2);
    p3 = 8*((min([a,0]))^2);
    p4 = (a-1)*((max([a-.5,0]))^2);
    f = p1 - p2 + p3 + p4;
end