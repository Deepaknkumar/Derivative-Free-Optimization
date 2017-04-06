%% convergence plots

%% 1. Rosenbrock function
fprintf("\n---------------------- Rosenbrock Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvRB(:,1)), 'Linewidth',3);
plot(log(GPSfvRB), 'Linewidth',3);
plot(log(MBDfvRB), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Rosenbrock Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 1. Rosenbrock function Function Evaluations
fprintf("\n---------------------- Rosenbrock Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcRB), 'Linewidth',3);
plot(log(GPSffcRB), 'Linewidth',3);
plot(log(MBDffcRB), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Rosenbrock Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 2. Cube function
fprintf("\n---------------------- Cube Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvCube(:,1)), 'Linewidth',3);
plot(log(GPSfvCube), 'Linewidth',3);
plot(log(MBDfvCube), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Cube Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 2. Cube function Function Evaluations
fprintf("\n---------------------- Cube Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcCube), 'Linewidth',3);
plot(log(GPSffcCube), 'Linewidth',3);
plot(log(MBDffcCube), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Cube Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 3. Beale function
fprintf("\n---------------------- Beale Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvBeale(:,1)), 'Linewidth',3);
plot(log(GPSfvBeale), 'Linewidth',3);
plot(log(MBDfvBeale), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Beale Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 3. Beale function Function Evaluations
fprintf("\n---------------------- Beale Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcBeale), 'Linewidth',3);
plot(log(GPSffcBeale), 'Linewidth',3);
plot(log(MBDffcBeale), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Beale Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 4. Modified Box function
fprintf("\n---------------------- Modified Box Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvmBox(:,1)), 'Linewidth',3);
plot(log(GPSfvmBox), 'Linewidth',3);
plot(log(MBDfvmBox), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Modified Box Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 4. Modified Box function Function Evaluations
fprintf("\n---------------------- Modified Box Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcmBox), 'Linewidth',3);
plot(log(GPSffcmBox), 'Linewidth',3);
plot(log(MBDffcmBox), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Modified Box Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 5. Enzyme/Kowalik Osborne I
fprintf("\n---------------------- Enzyme/Kowalik Osborne I Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvKO(:,1)), 'Linewidth',3);
plot(log(GPSfvKO), 'Linewidth',3);
plot(log(MBDfvKO), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Enzyme/Kowalik Osborne I Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 5. Enzyme/Kowalik Osborne I Function Evaluations
fprintf("\n---------------------- Enzyme/Kowalik Osborne I Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcKO), 'Linewidth',3);
plot(log(GPSffcKO), 'Linewidth',3);
plot(log(MBDffcKO), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Enzyme/Kowalik Osborne I Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 6. Enzyme/Kowalik Osborne II
fprintf("\n---------------------- Enzyme/Kowalik Osborne II Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvKO2(:,1)), 'Linewidth',3);
plot(log(GPSfvKO2), 'Linewidth',3);
plot(log(MBDfvKO2), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Enzyme/Kowalik Osborne II Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 6. Enzyme/Kowalik Osborne II Function Evaluations
fprintf("\n---------------------- Enzyme/Kowalik Osborne II Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcKO2), 'Linewidth',3);
plot(log(GPSffcKO2), 'Linewidth',3);
plot(log(MBDffcKO2), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Enzyme/Kowalik Osborne II Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 7. Powell 4 Variable function
fprintf("\n---------------------- Powell 4 Variable Function Convergence -----------------\n");
figure, hold on
plot(log(NMfvp4v(:,1)), 'Linewidth',3);
plot(log(GPSfvp4v), 'Linewidth',3);
plot(log(MBDfvp4v), 'Linewidth',3);
xlabel('Iterations');
ylabel('log(fbest) Values');
title('Convergence plot for Powell 4 Variable Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off

%% 7. Powell 4 Variable function Function Evaluations
fprintf("\n---------------------- Powell 4 Variable Function Convergence -----------------\n");
figure, hold on
plot(log(NMffcp4v), 'Linewidth',3);
plot(log(GPSffcp4v), 'Linewidth',3);
plot(log(MBDffcp4v), 'Linewidth',3);
xlabel('Function Evaluations');
ylabel('log(fbest) Values');
title('Convergence plot for Powell 4 Variable Function');
legend('Nelder Mead Algorithm','Generalized Pattern Search','Model Based Descent');
hold off