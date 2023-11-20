function[sxMax, syMax, vx_final, vy_final, v_final, curve, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass)

air_density=1.225;
g=9.81;
tspan = [0, 10];

alpha=air_density*c_d*area;

f = @(t, v) [-alpha/mass*sqrt(v(1)^2+v(2)^2)*v(1);  %define system of equations
    -alpha/mass*sqrt(v(1)^2+v(2)^2)*v(2)-g];
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-12);

[t, y] = ode45(f, tspan, v0, options);
curve = [t, y];

sx = cumtrapz(t, y(:, 1));  % cumulative intergral of horizontal velocity 
sy = cumtrapz(t, y(:, 2));  % cumulative intergral of vertical velocity 

syMax = max(sy);
indice = find(sy < 0, 1);  % find where robot reaches the floor
sxMax =sx(indice);        % find corrospodnig horozontal distance traveled

vx_final = y(indice, 1);
vy_final = y(indice, 2);
v_final = sqrt(vx_final^2+vy_final^2);

end

