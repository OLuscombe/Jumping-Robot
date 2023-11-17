function optimal_angle = calculate_optimal_jump_angle(m, v0, g, Cd, A)
    % Constants
    rho = 1.225; % Air density at sea level in kg/m^3
 
    % Function to calculate range for a given angle
    function range = jump_range(theta)
        % Initial velocity components
        v0x = v0 * cos(theta); % Horizontal component
        v0y = v0 * sin(theta); % Vertical component
 
        % Simplified drag force
        drag_force = 0.5 * Cd * rho * A * (v0^2);
 
        % Time of flight (ignoring drag for simplicity)
        t_flight = (2 * v0y) / g;
 
        % Horizontal distance traveled (ignoring drag for simplicity)
        range = v0x * t_flight - drag_force/m * t_flight^2;
    end
 
    % Finding the optimal angle
    optimal_range = 0;
    optimal_angle = 0;
    for theta = 0:1:90
        theta_rad = deg2rad(theta); % Convert angle to radians
        current_range = jump_range(theta_rad);
        if current_range > optimal_range
            optimal_range = current_range;
            optimal_angle = theta;
        end
    end
end