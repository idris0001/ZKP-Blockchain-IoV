function simulate_vehicle_IT_requests_plot()
    % Number of vehicles
    N = 50;
    vehicle_ids = arrayfun(@(x) sprintf('V%03d', x), 1:N, 'UniformOutput', false);

    % Initialize simulation parameters
    T_sys = 0;              % Simulated clock (seconds)
    T_max_wait = 10;        % Max wait for blockchain response

    % Preallocate arrays for logging
    timestamps = zeros(1, N);     % Time when request was generated
    retries = zeros(1, N);        % Number of retries

    % Simulation loop
    for i = 1:N
        vehicle_id = vehicle_ids{i};
        IT_received = false;

        % Generate and send request
        response_time = rand() * T_max_wait;
        pause(response_time);
        T_sys = T_sys + response_time;

        % Log timestamp
        timestamps(i) = T_sys;

        % Blockchain response simulation
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

        % Optional console log (disable if speed matters)
        fprintf('[%.2f sec] Vehicle %s: Request sent. Retries: %d\n', ...
            timestamps(i), vehicle_id, retries(i));
    end

    % Plot 1: Vehicle vs Request Time
    figure;
    plot(1:N, timestamps, '-o');
    xlabel('Vehicle Number');
    ylabel('Request Time (sec)');
    title('Vehicle Request Time Progression');
    grid on;

    % Plot 2: Vehicle vs Retry Count
    figure;
    stem(1:N, retries, 'filled');
    xlabel('Vehicle Number');
    ylabel('Retry Count');
    title('Number of Retries per Vehicle');
    ylim([0 3]);
    grid on;

    % Optional: Save data to CSV
    T = table((1:N)', timestamps', retries', ...
        'VariableNames', {'VehicleNumber', 'RequestTime_sec', 'RetryCount'});
    writetable(T, 'vehicle_IT_request_log.csv');
end
