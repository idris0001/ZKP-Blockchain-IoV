function zkp_results = run_zkp_only(num_vehicles, T_min, T_max, T_total)
    % ZKP-only ablation experiment
    % Author: Abdulhameed Idris

    T_sys = 0; % Initialize system time
    silent_mode = true(num_vehicles, 1); 
    T_silent = zeros(num_vehicles, 1); 
    T_end_silent = zeros(num_vehicles, 1); 

    % Assign initial silent periods
    for i = 1:num_vehicles
        R_f = rand();
        T_silent(i) = T_min + R_f * (T_max - T_min);
        T_end_silent(i) = T_sys + T_silent(i);
    end

    % Initialize log
    log = {};

    % Simulation loop
    while T_sys <= T_total
        for i = 1:num_vehicles
            if silent_mode(i) && T_sys >= T_end_silent(i)
                msg = sprintf('[%.2f sec] Vehicle %d: Silent over (%.2f sec)', ...
                               T_sys, i, T_silent(i));
                log{end+1} = msg;

                silent_mode(i) = false;

                % ZKP-only interaction (no blockchain validation here)
                log{end+1} = sprintf('[%.2f sec] Vehicle %d: IT request sent, waiting for ZKP...', T_sys, i);
                pause(0.5);
                log{end+1} = sprintf('[%.2f sec] Vehicle %d: ZKP verified identity.', T_sys, i);

                % Reassign silent period
                R_f = rand();
                T_silent(i) = T_min + R_f * (T_max - T_min);
                T_end_silent(i) = T_sys + T_silent(i);
                silent_mode(i) = true;
            end
        end
        T_sys = T_sys + 1;
        pause(0.1);
    end

    % Package results
    zkp_results.log = log;
    zkp_results.silent_mode = silent_mode;
    zkp_results.T_silent = T_silent;
    zkp_results.T_end_silent = T_end_silent;

    % --- Save Data to CSV for structured analysis ---
    T = table((1:num_vehicles)', zkp_results.T_silent, zkp_results.T_end_silent, ...
        'VariableNames', {'VehicleNumber','SilentDuration_sec','SilentEndTime_sec'});
    writetable(T, 'zkp_only_log.csv');

    % --- Display log in console ---
    disp('--- ZKP Simulation Log ---');
    for i = 1:length(zkp_results.log)
        disp(zkp_results.log{i});
    end

    disp('--- ZKP Simulation End ---');
end