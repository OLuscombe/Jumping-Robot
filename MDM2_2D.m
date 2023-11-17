air_density=1.225;
c_d =0.47;  % drag coefficent (0.47 for sphere) 
area=0.01;  % incident area to air flow
mass=1;     % total mass of the robot
g=9.81;
alpha=air_density*c_d*area;

f = @(t, v) [-alpha/mass*sqrt(v(1)^2+v(2)^2)*v(1);  %define system of equations
    -alpha/mass*sqrt(v(1)^2+v(2)^2)*v(2)-g];

v0=[2, 2];
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-12);
tspan = [0, 10];
[t, y] = ode45(f, tspan, v0, options);

sx = cumtrapz(t, y(:, 1));  % cumulative intergral of horizontal velocity 
sy = cumtrapz(t, y(:, 2));  % cumulative intergral of vertical velocity 

ymax = max(sy)

indices = find(sy < 0, 1)  % find where robot reaches the floor
sxmax=sx(indices)            % find corrospodnig horozontal distance traveled
xFinalV = y(indices, 1)
yFinalV = y(indices, 2)
plot(sx, sy, 'LineWidth', 2, 'Color', '#0072BD'), hold off;
grid on;
ylim([0, 5])
axis("equal")

finalV = sqrt(xFinalV^2+yFinalV^2)
% Define the parameters
m = 1;  % mass in kg
k = 10;  % spring constant in N/m
d = 5;  % damping coefficient in N-s/m

% Define the initial conditions
x0 = 0;  % initial displacement in m
v0 = finalV;  % initial velocity in m/s

% Define the time step
dt = 0.01;  % time step in s

% Define the simulation time
t_max = 10;  % simulation time in s
t = 0:dt:t_max;
x = zeros(1,length(t));
v = zeros(1,length(t));

x(1) = x0;
v(1) = v0;
for i = 2:length(t)
  a = -k * x(i-1) - d * v(i-1);
  v(i) = v(i-1) + a * dt;
  x(i) = x(i-1) + v(i) * dt;
end

plot(t, x);
xlabel('Time (s)');
ylabel('Displacement (m)');


