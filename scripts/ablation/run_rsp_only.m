% run_rsp_only.m
% Ablation experiment for RSP-only configuration

% Define simulation parameters
num_vehicles = 5;
T_min = 5;
T_max = 15;
T_total = 60;

% Run RSP module
rsp_results = run_rsp_module(num_vehicles, T_min, T_max, T_total);

% Display simulation log
disp('--- RSP Simulation Log ---');
for i = 1:length(rsp_results.log)
    disp(rsp_results.log{i});
end

% Save results for analysis (MAT-file)
save('results_rsp_only.mat', 'rsp_results');

% --- Save Data to CSV for structured analysis ---
T = table((1:num_vehicles)', rsp_results.T_silent, rsp_results.T_end_silent, ...
    'VariableNames', {'VehicleNumber','SilentDuration_sec','SilentEndTime_sec'});

writetable(T, 'rsp_only_log.csv');

disp('--- RSP Simulation End ---');