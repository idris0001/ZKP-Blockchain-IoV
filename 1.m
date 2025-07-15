% Random Silent Period Algorithm - Multi-Vehicle Simulation
% Author: Abdulhameed Idris
% Date: [Insert Date]
% -------- Input Parameters --------
num_vehicles = 5; % Number of vehicles in the simulation
T_min = 5; % Minimum silent period duration (seconds)
T_max = 15; % Maximum silent period duration (seconds)
T_total = 60; % Total simulation time (seconds)
T_sys = 0; % Initialize system time
% Initialize vehicle states
silent_mode = true(num_vehicles, 1); % All vehicles start in silent mode
T_silent = zeros(num_vehicles, 1); % Silent period duration for each vehicle
T_end_silent = zeros(num_vehicles, 1); % Time when silent period ends
% Assign random silent periods
for i = 1:num_vehicles
R_f = rand(); % Generate a random value
T_silent(i) = T_min + R_f * (T_max - T_min);
T_end_silent(i) = T_sys + T_silent(i);
end
% -------- Simulation Loop --------
disp('Simulation Start');
while T_sys <= T_total
for i = 1:num_vehicles
if silent_mode(i) && T_sys >= T_end_silent(i)
fprintf('\n[%.2f sec] Vehicle %d: Silent period over (%.2f sec) — requesting IT from blockchain.\n', T_sys, i, T_silent(i));
silent_mode(i) = false; % Resume communication
% Simulate blockchain interaction
fprintf('[%.2f sec] Vehicle %d: IT request sent, waiting for ZKP validation...\n', T_sys, i);
pause(0.5); % Simulating processing delay
fprintf('[%.2f sec] Vehicle %d: Blockchain validated identity, communication resumed.\n', T_sys, i);
% Reassign a new silent period
R_f = rand();
T_silent(i) = T_min + R_f * (T_max - T_min);
T_end_silent(i) = T_sys + T_silent(i);
silent_mode(i) = true; % Enter silent mode again
end
end
% Increment system time
T_sys = T_sys + 1;
pause(0.1); % Simulate real-time execution
end
disp('\nSimulation End');
