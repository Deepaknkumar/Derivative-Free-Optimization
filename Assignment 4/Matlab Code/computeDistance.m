function[dist] = computeDistance(x,y)
    dist = (sum((x-y).^2))^.5;
end