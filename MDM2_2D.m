c_d =1;      % drag coefficent (0.47 for sphere) 
area=1;      % incident area to air flow
mass=10;     %total mass of the robot
angles = linspace(0.1, pi/2, 100);
initialVel = 11.54;

xMaxList = [];

for i =1 : length(angles)
    currAngle = angles(i);
    v0 = [initialVel*cos(currAngle), initialVel*sin(currAngle), 0, 0];

    [sxMax, syMax, vx_final, vy_final, v_final, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass);
    xMaxList = [xMaxList, sxMax];
end

bestDistance = max(xMaxList)
indice = find(xMaxList ==  max(xMaxList));
bestAngle = angles(indice)
v0 = [initialVel*cos(bestAngle), initialVel*sin(bestAngle), 0, 0];
[sxMax, syMax, vx_final, vy_final, v_final, sx, sy] = coupledAirResistanceSolver(v0, c_d, area, mass);
plot(sx, sy, 'LineWidth', 2, 'Color', '#0072BD'), hold off;
xlabel("Horizontal Displacement");
ylabel("Vertical Displacement");
title("Displacement Graph");
v_final
syMax
rad2deg(bestAngle) 
grid on;
ylim([0, 5])
axis("equal")


