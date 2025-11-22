function run_blockchain_only(num_vehicles, T_max_wait)
    % Blockchain Only Ablation Script
    % Author: Abdulhameed Idris
    % ---------------------------------------------
    % num_vehicles : number of vehicles in simulation
    % T_max_wait   : maximum wait time for blockchain response (seconds)

    if nargin < 2
        T_max_wait = 10; % default max wait
    end
    if nargin < 1
        num_vehicles = 50; % default number of vehicles
    end

    % Initialize vehicle IDs
    vehicle_ids = arrayfun(@(x) sprintf('V%03d', x), 1:num_vehicles, 'UniformOutput', false);

    % Initialize simulation parameters
    T_sys = 0;                      % Simulated clock (seconds)
    timestamps = zeros(1, num_vehicles); % Request times
    retries = zeros(1, num_vehicles);    % Retry counts

    disp('--- Blockchain Only Simulation Log ---');

    % Simulation loop
    for i = 1:num_vehicles
        vehicle_id = vehicle_ids{i};
        IT_received = false;

        % Generate and send request
        response_time = rand() * T_max_wait;
        pause(response_time);
        T_sys = T_sys + response_time;

        % Log timestamp
        timestamps(i) = T_sys;

        % Blockchain response simulation (80% success rate)
        Blockchain_response = rand() > 0.2;
        if Blockchain_response
            IT_received = true;
            retries(i) = 0;
        else
            retry = 0;
            while ~IT_received && retry < 3
                retry = retry + 1;
                pause(1);
                T_sys = T_sys + 1;
                Blockchain_response = rand() > 0.2;
                if Blockchain_response
                    IT_received = true;
                    retries(i) = retry;
                end
            end
            if ~IT_received
                retries(i) = 3; % Max retries reached
            end
        end

        % Console log
        fprintf('[%.2f sec] Vehicle %s: Request sent. Retries: %d\n', ...
            timestamps(i), vehicle_id, retries(i));
    end

    % --- Save Data Only (no plots) ---
    T = table((1:num_vehicles)', timestamps', retries', ...
        'VariableNames', {'VehicleNumber','RequestTime_sec','RetryCount'});
    writetable(T, 'blockchain_only_log.csv');

    disp('--- Blockchain Only Simulation End ---');
end