function[sxMax, syMax, vx_final, vy_final, v_final, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass)

air_density=1.225;
g=9.81;
tspan = [0, 50];
alpha=air_density*c_d*area;


f = @(t, v) [-alpha/mass*sqrt(v(1)^2+v(2)^2)*v(1);  %define system of equations
    -alpha/mass*sqrt(v(1)^2+v(2)^2)*v(2)-g; v(1); v(2)];

options = odeset('RelTol', 1e-10, 'AbsTol', 1e-12,'Events', @event_function);

[t, y] = ode45(f, tspan, v0, options);
sx = y(:, 3);
sy = y(:, 4);
syMax = y(end, 4);
sxMax = y(end, 3);


vx_final = y(end, 1)
vy_final = y(end, 2)
v_final = sqrt(vx_final.^2+vy_final.^2)

end

function [value, isterminal, direction] = event_function(t, y)
    % Define the event function
    value = y(4);  % Stop when y reaches 0.5
    isterminal = 1;  % Terminate the integration
    direction = 0;   % Detect events in either direction
end

