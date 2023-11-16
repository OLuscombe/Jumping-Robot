air_density=1.225;
c_d =0.47;  % drag coefficent (0.47 for sphere) 
area=0.01;  % incident area to air flow
mass=1;     % total mass of the robot
g=9.81;
alpha=air_density*c_d*area;

f = @(t, v) [-alpha/mass*sqrt(v(1)^2+v(2)^2)*v(1);  %define system of equations
    -alpha/mass*sqrt(v(1)^2+v(2)^2)*v(2)-g];

v0=[3, 3];
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-12);
tspan = [0, 10];
[t, y] = ode45(f, tspan, v0, options);

sx = cumtrapz(t, y(:, 1));  % cumulative intergral of horizontal velocity 
sy = cumtrapz(t, y(:, 2));  % cumulative intergral of vertical velocity 

ymax = max(sy)

indices = find(sy < 0, 1);  % find where robot reaches the floor
xmax=sx(indices)            % find corrospodnig horozontal distance traveled

plot(sx, sy, 'LineWidth', 2, 'Color', '#0072BD'), hold off;

grid on;
ylim([0, 5])
axis("equal")


