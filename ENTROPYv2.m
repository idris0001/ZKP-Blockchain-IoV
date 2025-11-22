% Data
no_of_vehicle = [50, 100, 150, 200];
proposed_scheme = [6.69, 15.20, 25.21, 39.51];
obfuscation_based = [25, 32, 40, 47];
rfpm = [0.1898, 0.0837, 0.0831, 0.5964];
group_leader_shadowing = [4.5, 6.7, 8.3, 9.5];
coop_pseudonym_swapping = [1.23, 1.24, 1.24, 1.22];

% Figure with size in inches (IEEE-style)
figure('Units', 'inches', 'Position', [1 1 3.5 2.5]);

% Plot with thicker lines and consistent marker size
plot(no_of_vehicle, proposed_scheme, '-o', 'LineWidth', 2, 'MarkerSize', 7); hold on;
plot(no_of_vehicle, obfuscation_based, '-^', 'LineWidth', 2, 'MarkerSize', 7);
plot(no_of_vehicle, rfpm, '-d', 'LineWidth', 2, 'MarkerSize', 7);
plot(no_of_vehicle, group_leader_shadowing, '-p', 'LineWidth', 2, 'MarkerSize', 7);
plot(no_of_vehicle, coop_pseudonym_swapping, '-h', 'LineWidth', 2, 'MarkerSize', 7);

% Set font and size exactly like your example
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);

xlabel('Number of Vehicles', 'FontName', 'Times New Roman', 'FontSize', 9);
ylabel('Entropy', 'FontName', 'Times New Roman', 'FontSize', 9);
title('Comparison of Location Privacy Schemes', 'FontName', 'Times New Roman', 'FontSize', 10);

grid on;

% Move legend outside to the northeast
legend({'Proposed scheme', 'Obfuscation-based [50]', ...
        'RFPM [49]', 'Group-Leader Shadowing [34]', 'Coop. Pseudonym Swapping [33]'}, ...
       'Location', 'northeastoutside', 'FontName', 'Times New Roman', 'FontSize', 8, 'Box', 'off');

% Adjust plot area for legend
set(gca, 'Position', [0.1 0.15 0.65 0.75]);

% Tighten inset for less white space
set(gca, 'LooseInset', get(gca, 'TightInset'));
