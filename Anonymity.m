% Vehicle IDs
x = [50, 100, 150, 200];

% Anonymity Set Sizes for each scheme
proposed = [10.88, 10.99, 11.25, 11.98];
%   safety_aware = [1.4, 1.9, 2.5, 3.0];
obfuscation = [4.5, 5.0, 5.3, 7.0];
rfpm = [1.2781, 0.8047, 0.9107, 2.7396];
group_leader = [1.0, 1.2, 1.5, 1.8];

% Plot each scheme
plot(x, proposed, '-o', 'LineWidth', 2); hold on;
%plot(x, safety_aware, '-s', 'LineWidth', 2);
plot(x, obfuscation, '-^', 'LineWidth', 2);
plot(x, rfpm, '-d', 'LineWidth', 2);
plot(x, group_leader, '-x', 'LineWidth', 2);

% Add labels and title
xlabel('Number of Vehicles');
ylabel('Anonymity Set Size');
title('Anonymity Set Size Comparison Across Schemes');

% Add legend
legend({'Proposed scheme', 'Obfuscation-based [50]', 'RFPM [49]', 'Group-Leader Shadowing [34]'}, ...
       'Location', 'northeast');

% Optional: Grid and axis limits
grid on;
ylim([0 12]);