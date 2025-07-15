% Data: Estimated communication overhead in bytes per transaction						
schemes = {						
'Proposed Scheme (ZKP + Blockchain)', 						
'Safety-Aware Privacy (2023)', 						
'Obfuscation-based Privacy (2022)', 						
'RFPM (2022)', 						
'Group-Leader Shadowing (2023)', 						
'Cooperative Pseudonym Swapping (2022)'						
};						
						
overheads = [300, 480, 520, 450, 580, 500];						
						
% Bar plot						
figure('Position', [100, 100, 1000, 500]);						
bar(overheads, 'FaceColor', [0.4, 0.7, 1]);						
title('Comparative Communication Overhead of Location Privacy Schemes');						
ylabel('Overhead (Bytes)');						
xticks(1:length(schemes));						
xticklabels(schemes);						
xtickangle(45);						
grid on;						
						
% Annotate values						
for i = 1:length(overheads)						
text(i, overheads(i) + 10, num2str(overheads(i)), ...						
'HorizontalAlignment', 'center', ...						
'VerticalAlignment', 'bottom');						
end						
						
% Create and display table						
T = table(schemes', overheads', ...						
'VariableNames', {'Scheme', 'Estimated_Overhead_Bytes'});						
disp(T)						
						
