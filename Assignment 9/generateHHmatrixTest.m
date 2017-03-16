% Test Vectors
v1 = [3;-4];
v2 = [-4;-3];
v3 = [-3;-4;12];
v4 = [-2,-2,3,3]';

% Expected Outputs
expected_HHm1 = [7/25,24/25;24/25,-7/25];
expected_HHm2 = [-0.280000000000000,-0.960000000000000;-0.960000000000000,0.280000000000000];
expected_HHm3 = [0.893491124260355,-0.142011834319527,0.426035502958580;-0.142011834319527,0.810650887573965,0.568047337278107;0.426035502958580,0.568047337278107,-0.704142011834320];
expected_HHm4 = [0.692307692307692,-0.307692307692308,0.461538461538462,0.461538461538462;-0.307692307692308,0.692307692307692,0.461538461538462,0.461538461538462;0.461538461538462,0.461538461538462,0.307692307692308,-0.692307692307692;0.461538461538462,0.461538461538462,-0.692307692307692,0.307692307692308];

% Preconditions
tol = 1e-6;

%% Test 1: Vector v1 Test
[HHm1] = generateHHmatrix(v1);
assert((sum(sum(abs(HHm1-expected_HHm1)))) <= tol,'Vector v1 case failed.');

%% Test 2: Vector v2 Test
[HHm2] = generateHHmatrix(v2);
assert((sum(sum(abs(HHm2-expected_HHm2)))) <= tol,'Vector v2 case failed.');

%% Test 3: Vector v3 Test
[HHm3] = generateHHmatrix(v3);
assert((sum(sum(abs(HHm3-expected_HHm3)))) <= tol,'Vector v3 case failed.');

%% Test 4: Vector v4 Test
[HHm4] = generateHHmatrix(v4);
assert((sum(sum(abs(HHm4-expected_HHm4)))) <= tol,'Vector v4 case failed.');