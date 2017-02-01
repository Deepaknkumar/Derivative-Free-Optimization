function [seq] = modifiedSequenceGeneratorq3_2(n)
    seq = [];
    if (n==0)
        seq = [0];
    else
        for i=1:2^(2*n-1)
            elementToAdd = -i/(2^n);
            if (elementToAdd == -0.5)
                seq = [seq,-(10^n)];
            else
                seq = [seq,elementToAdd];
            end
        end
    end
end