% Data
no_of_vehicle = [50, 100, 150, 200];
PROP = [6.69, 15.20, 25.21, 39.51];
OBF  = [25, 32, 40, 47];
RFPM = [0.1898, 0.0837, 0.0831, 0.5964];
GLS  = [4.5, 6.7, 8.3, 9.5];
CPS  = [1.23, 1.24, 1.24, 1.22];

% Create IEEE-style figure
figure('Units', 'inches', 'Position', [1 1 3.5 2.5]);

% Plot each scheme with distinct color and marker
plot(no_of_vehicle, PROP, '-o', 'Color', [0 0.45 0.74], 'LineWidth', 2, 'MarkerSize', 7); hold on;  % Blue circle
plot(no_of_vehicle, OBF,  '-v', 'Color', [0.93 0.69 0.13], 'LineWidth', 2, 'MarkerSize', 7);        % Yellow triangle
plot(no_of_vehicle, RFPM, '-d', 'Color', [0.49 0.18 0.56], 'LineWidth', 2, 'MarkerSize', 7);        % Purple diamond
plot(no_of_vehicle, GLS,  '-s', 'Color', [0.00 0.50 0.00], 'LineWidth', 2, 'MarkerSize', 7);        % Green square
plot(no_of_vehicle, CPS,  '-x', 'Color', [0.85 0.33 0.10], 'LineWidth', 2, 'MarkerSize', 7);        % Orange cross

% Axis labels and title
xlabel('Number of Vehicles', 'FontName', 'Times New Roman', 'FontSize', 9);
ylabel('Entropy (bits)', 'FontName', 'Times New Roman', 'FontSize', 9);
title('Location Entropy Across Schemes', 'FontName', 'Times New Roman', 'FontSize', 10);

% Font settings
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xticks(no_of_vehicle);
yticks(0:10:50);
grid on;

% Legend with acronyms and reference numbers, styled vertically
legend({'PROP', 'OBF [47]', 'RFPM [48]', 'GLS [33]', 'CPS [30]'}, ...
       'Location', 'eastoutside', ...        % places legend to the right of the plot
       'Orientation', 'vertical', ...        % stacks entries vertically
       'FontName', 'Times New Roman', 'FontSize', 8, 'Box', 'off');

% Adjust layout to leave space for vertical legend
set(gca, 'Position', [0.1 0.15 0.65 0.75]);  % shrinks plot area to make room

% Adjust layout to prevent clipping
set(gca, 'LooseInset', max(get(gca,'TightInset'), 0.02));
set(gcf, 'PaperPositionMode', 'auto');
set(gcf, 'Renderer', 'painters');  % Ensures vector rendering

% Export clean vector PDF with embedded fonts
exportgraphics(gcf, 'entropy_plot.pdf', ...
    'ContentType', 'vector', ...
    'BackgroundColor', 'none');

