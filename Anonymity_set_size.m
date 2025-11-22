% Vehicle IDs
x = [50, 100, 150, 200];

% Anonymity Set Sizes for each scheme
proposed      = [10.88, 10.99, 11.25, 11.98];
safety_aware  = [1.4, 1.9, 2.5, 3.0];
obfuscation   = [4.5, 5.0, 5.3, 7.0];
rfpm          = [1.2781, 0.8047, 0.9107, 2.7396];
group_leader  = [1.0, 1.2, 1.5, 1.8];

% Create figure
figure;

% Plot each scheme with distinct markers
plot(x, proposed, '-o', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(x, safety_aware, '-s', 'LineWidth', 2, 'MarkerSize', 8);
plot(x, obfuscation, '-^', 'LineWidth', 2, 'MarkerSize', 8);
plot(x, rfpm, '-d', 'LineWidth', 2, 'MarkerSize', 8);
plot(x, group_leader, '-x', 'LineWidth', 2, 'MarkerSize', 8);

% Labels and title
xlabel('Number of Vehicles', 'FontSize', 12);
ylabel('Anonymity Set Size', 'FontSize', 12);
title('Anonymity Set Size Comparison Across Schemes', 'FontSize', 12);

% Legend placed outside to avoid overlap
legend({'PROP', 'SAP [12]', 'OBF [50]', 'RFPM [49]', 'GLS [34]'}, ...
       'Location', 'southoutside', 'Orientation', 'horizontal', 'FontSize', 10);

% Axis ticks and limits
xticks(x);
yticks(0:2:12);
ylim([0 12]);
grid on;

% Tight layout to remove excess white space
set(gca, 'LooseInset', max(get(gca,'TightInset'), 0.02));

% Adjust layout to prevent clipping
set(gca, 'LooseInset', max(get(gca,'TightInset'), 0.02));
set(gcf, 'Units', 'inches', 'Position', [1, 1, 6.5, 4]);  % Wider figure
set(gcf, 'PaperPositionMode', 'auto');

% Export with full layout and vector quality
exportgraphics(gcf, 'Anonymity_set_size_plot.pdf', ...
    'ContentType', 'vector', 'BackgroundColor', 'none');