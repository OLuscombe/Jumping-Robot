% Define the ODE

air_density=1.225;
c_d =0.47;
area=1;
mass=1;
g=9.81;
alpha=air_density*c_d*area;
y0 = 5;
tspan = [0, 30];

% Set the initial condition.


% Set the time span.


% Solve the differential equation.
[t, y] = ode45(@(t, y) -(y.^2).*alpha-g, tspan, y0);

% Plot the solution.
plot(t, y);
xlabel('Time');
ylabel('Solution');
ylim([0,20]);