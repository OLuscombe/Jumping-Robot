c_d =0.47;      % drag coefficent (0.47 for sphere) 
area=0.01;      % incident area to air flow
mass=1;     %total mass of the robot
angles = linspace(0.1, pi/2, 100);
initialVel = 5;

xMaxList = [];

for i =1 : length(angles)
    currAngle = angles(i);
    v0 = [initialVel*cos(currAngle), initialVel*sin(currAngle)]
    [sxMax, syMax, vx_final, vy_final, v_final, curve, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass);
    xMaxList = [xMaxList, sxMax];
end

bestDistance = max(xMaxList)
indice = find(xMaxList ==  max(xMaxList));
bestAngle = angles(indice);
v0 = [initialVel*cos(bestAngle), initialVel*sin(bestAngle)];

angleDegrees = rad2deg(bestAngle)
[sxMax, syMax, vx_final, vy_final, v_final, curve, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass);
plot(sx, sy, 'LineWidth', 2, 'Color', '#0072BD'), hold off;
grid on;
ylim([0, 5])
axis("equal")


