AirDensity = 1.225;  %given air density 
Cd = 0.47; %drag coefficient of object
xArea = 0.75;  %cross sectional area of object (ball)
Vo = 11.54; %initial speed

g = 9.8; %gravity 
%m = 1; %mass of robot
E = 250;  %initial energy stored


%k = (1/2 * AirDensity * Cd * xArea);


m = linspace(1,100,10000);
%m = 3
%E = linspace(100,10000,1000);


k = (1/2 * AirDensity * Cd * xArea)./(m) ; %drag coefficent

%1/2 m v^2  = E  (1/2 k x^2)
%v^2  = 2*E / m  (k x^2) / m
TVo = 2.*E ./ m; %inital Vo^2
Xh = m./(2.*k) .* log( ((k.*(Vo^2))./(m.*g)) + 1  ); %height in relation to changing mass with changing energy
Xh1 = m./(2.*k) .* log( ((k.*(TVo))./(m.*g)) + 1  ); %height where energy is constant as mass changes

plot(m,Xh,'r-',m,Xh1,'b-','LineWidth',1)
grid on
xlabel('mass') ; ylabel('height reached')
legend('fixed inital velocity of 11.54','fixed initial energy of 250 ')
title('height vs mass')
maxheightEn = max(Xh1)
maxheightVel = max(Xh)