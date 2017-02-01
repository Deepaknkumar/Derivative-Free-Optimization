

%% q3.2(b)
numiter = 5;
fmin = q3_2function(0);
fminData = [];
fevalData = [];
minval = 10000000000000000000;

for i=1:numiter
   seq = sequenceGeneratorq3_2(i);
   for j = 1:length(seq)
       feval = q3_2function(seq(j));
       if(feval < fmin)
           fmin = feval;
           minval = seq(j);
       end
       fminData = [fminData,fmin];
       fevalData = [fevalData,feval];
       fprintf('Iteration (%d,%d) is running fmin is %d at %f \n',i,j,fmin,minval)
   end
end



%% q3.2(c)
numiter = 5;
fmin = q3_2function(0);
fminCData = [];
fevalCData = [];
minval = 10000000000000000000;

for i=1:numiter
   seq = modifiedSequenceGeneratorq3_2(i);
   for j = 1:length(seq)
       feval = q3_2function(seq(j));
       if(feval < fmin)
           fmin = feval;
           minval = seq(j);
       end
       fminCData = [fminCData,fmin];
       fevalCData = [fevalCData,feval];
       fprintf('Iteration (%d,%d) is running fmin is %d at %f \n',i,j,fmin,minval)
   end
end