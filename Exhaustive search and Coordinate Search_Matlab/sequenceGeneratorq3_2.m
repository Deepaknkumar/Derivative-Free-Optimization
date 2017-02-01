function [seq] = sequenceGeneratorq3_2(n)
    seq = [];
    if (n==0)
        seq = [0];
    else
        for i=1:2^(2*n-1)
            seq = [seq,-i/(2^n)]; 
        end
    end
end