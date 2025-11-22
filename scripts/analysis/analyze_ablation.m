% --- Combined figure with improved layout ---
figure;
t = tiledlayout(3,1,'Padding','compact','TileSpacing','compact');
sgtitle('Ablation Study Results: RSP-only, ZKP-only, Blockchain-only, Full');

% (1) Silent Duration Comparison
nexttile;
b = bar([avg_rsp_silent, avg_zkp_silent, avg_full_silent]);
set(gca, 'XTickLabel', {'RSP-only','ZKP-only','Full System'});
ylabel('Avg Silent Duration (sec)');
title('Silent Duration Comparison (Blockchain-only not applicable)');
grid on;

% Annotate bars with values
text(1:length(b.YData), b.YData, ...
    arrayfun(@(x) sprintf('%.2f', x), b.YData, 'UniformOutput', false), ...
    'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold');

% (2) Blockchain Retry Distribution
nexttile;
h = histogram(bc_data.RetryCount, 'BinEdges', [-0.5 0.5 1.5 2.5 3.5]);
xlim([-0.25 3.25]);                             % Tighten axis to avoid extra ticks
set(gca, 'XTick', [0 1 2 3]);                   % Set tick positions
set(gca, 'XTickLabel', {'0','1','2','3'});      % Set tick labels manually
xlabel('Retry Count');
ylabel('Frequency');
title('Blockchain-only Retry Distribution');
grid on;

% Add frequency labels above each bar
binCenters = h.BinEdges(1:end-1) + diff(h.BinEdges)/2;
for i = 1:length(h.Values)
    if h.Values(i) > 0
        text(binCenters(i), h.Values(i), num2str(h.Values(i)), ...
            'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold');
    end
end

% (3) Full System Silent End Times
nexttile;
plot(full_data.VehicleNumber, full_data.SilentEndTime_sec, 'o-','LineWidth',1.5);
xlabel('Vehicle Number');
ylabel('Silent End Time (sec)');
title('Full System Silent End Times');
grid on;

% --- Save clean figure ---
set(gcf, 'Units', 'inches', 'Position', [1 1 6 8]);  % Adjust width and height
exportgraphics(gcf, 'ablation_study_clean.png', 'Resolution', 300);
