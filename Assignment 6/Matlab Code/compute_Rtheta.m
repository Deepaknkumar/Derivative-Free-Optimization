function [Rtheta] = compute_Rtheta(theta)
Rtheta = [cos(theta),-sin(theta);sin(theta),cos(theta)];
end