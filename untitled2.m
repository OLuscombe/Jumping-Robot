m = 5; % Mass in kg
v0 = 10; % Initial velocity in m/s
g = 9.81; % Gravity in m/s^2
Cd = 1.0; % Drag coefficient
A = 0.01; % Cross-sectional area in m^2
 
opt_angle = calculate_optimal_jump_angle(m, v0, g, Cd, A);
fprintf('Optimal jump angle: %f degrees\n', opt_angle);