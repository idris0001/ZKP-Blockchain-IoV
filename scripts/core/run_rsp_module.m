function rsp_results = run_rsp_module(num_vehicles, T_min, T_max, T_total)
    % Random Silent Period Algorithm - Modular Version
    % Author: Abdulhameed Idris
        
    T_sys = 0; % Initialize system time
    silent_mode = true(num_vehicles, 1); % All vehicles start in silent mode
    T_silent = zeros(num_vehicles, 1); % Silent period duration for each vehicle
    T_end_silent = zeros(num_vehicles, 1); % Time when silent period ends

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
                msg = sprintf('[%.2f sec] Vehicle %d: Silent over (%.2f sec)', T_sys, i, T_silent(i));
                log{end+1} = msg;

                silent_mode(i) = false;

                % Simulate blockchain interaction
                log{end+1} = sprintf('[%.2f sec] Vehicle %d: IT request sent, waiting for ZKP...', T_sys, i);
                pause(0.5);
                log{end+1} = sprintf('[%.2f sec] Vehicle %d: Blockchain validated identity.', T_sys, i);

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
    rsp_results.log = log;
    rsp_results.silent_mode = silent_mode;
    rsp_results.T_silent = T_silent;
    rsp_results.T_end_silent = T_end_silent;
end
