%% BGR current vs BBB bits (variating temperature)

f = figure('visible','on');

clear; clc;
% test_board_measurements - 2_BGR.csv
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve'); % measurements data

X = [1:1:8];
BGR_R = 18000; % R = 18kohm
BGR_gain = 4; % BGR gain
BGR_current_30C = ((D.("30C")/BGR_R)/BGR_gain)*1000
BGR_current_20C = ((D.("20C")/BGR_R)/BGR_gain)*1000
BGR_current_10C = ((D.("10C")/BGR_R)/BGR_gain)*1000
BGR_current_0C = ((D.("0C")/BGR_R)/BGR_gain)*1000
BGR_current_m10C = ((D.("-10C")/BGR_R)/BGR_gain)*1000
BGR_current_m20C = ((D.("-20C")/BGR_R)/BGR_gain)*1000
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

hold on
plot(X, BGR_current_30C, '-o', X, BGR_current_20C, '-o', X, BGR_current_10C, '-o', X, BGR_current_0C, '-o', X, BGR_current_m10C, '-o', X, BGR_current_m20C, '-o', X, BGR_current_m30C, '-o', X, BGR_current_m40C, '-o')
plot([1:8], [5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
text(8.1, 5.01, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
hold off

%title('Reference current vs Bias setting')
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
yticks([3.5:0.25:5.5])
xlabel("Bias setting")
ylabel("Reference current [$\mu$A]")
legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast', 'NumColumns', 2)
box
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
savefig('fig/BGR_current_XBBB.fig')
exportgraphics(gcf,'pdf/BGR_current_XBBB.pdf','ContentType','vector');


%% BGR current vs BBB bits configuration @ 27$^{\circ}$C [vs Simulations]

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve'); % measurements data
SIM = readtable('BGR_data/current_Meas_vs_sim.txt', 'Format','%f %f %f %f %f %f'); % simulations data

SIM_double = table2array(SIM);

X = [1:1:8];
BGR_R = 18000; % R = 18kohm
BGR_gain = 4; % BGR gain

BGR_current_30C = ((D.("30C")/BGR_R)/BGR_gain)*1000
BGR_current_27C_sim_SS = SIM_double(:, 3)
BGR_current_27C_sim_TT = SIM_double(:, 4)
BGR_current_27C_sim_FF = SIM_double(:, 5)
BGR_current_27C_meas = SIM_double(:, 6)

hold on
plot(X, BGR_current_30C, '-o', X, BGR_current_27C_meas, '-+', X, BGR_current_27C_sim_FF, '-*', X, BGR_current_27C_sim_TT, '-*', X, BGR_current_27C_sim_SS, '-*')
plot([1:8], [5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
text(8.1, 5.01, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
hold off

box
%title('Reference current vs Bias setting')
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
%yticks([3.5:0.1:5.5])
xlabel("Bias setting")
ylabel("Reference current [$\mu$A]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('Measurement 06/2022 (T = $30^{\circ}$C)', 'Measurement 09/2021 (T = $27^{\circ}$C)', 'SCH FF (T = $27^{\circ}$C)', 'SCH TT (T = $27^{\circ}$C)', 'SCH SS (T = $27^{\circ}$C)', 'Location', 'northwest')
savefig('fig/BGR_current_XBBB_27C_sim.fig')
exportgraphics(gcf,'pdf/BGR_current_XBBB_27C_sim.pdf','ContentType','vector');


%% BGR current vs temperature (per BBB bits configuration)

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve');

X = [1:1:8];
BGR_R = 18000; % R = 20kohm
BGR_gain = 4; % BGR gain
BGR_current_30C = ((D.("30C")/BGR_R)/BGR_gain)*1000
BGR_current_20C = ((D.("20C")/BGR_R)/BGR_gain)*1000
BGR_current_10C = ((D.("10C")/BGR_R)/BGR_gain)*1000
BGR_current_0C = ((D.("0C")/BGR_R)/BGR_gain)*1000
BGR_current_m10C = ((D.("-10C")/BGR_R)/BGR_gain)*1000
BGR_current_m20C = ((D.("-20C")/BGR_R)/BGR_gain)*1000
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m32C = ((D.("-32C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m34C = ((D.("-34C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m36C = ((D.("-36C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m38C = ((D.("-38C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

BGR_tot = [BGR_current_m40C, BGR_current_m38C,  BGR_current_m36C,  BGR_current_m34C,  BGR_current_m32C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];
%BGR_tot = [BGR_current_m40C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];

bits = ["000", "001", "010", "011", "100", "101", "110", "111"];

% all BBB bits configuration in different plots
for i=1:8
    figure('visible','on');

    plot([-40, 0, 27], [5.012, 5.004, 4.990], '-*', 'LineStyle','--') % TT
    hold on
    plot([-40, 0, 27], [5.761, 5.757, 5.744], '-*', 'LineStyle','--') % FF
    hold on
    %plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle','--') % FS
    hold on
    %plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle','--') % SF
    hold on
    plot([-40, 0, 27], [4.447, 4.432, 4.420], '-*', 'LineStyle','--') % SS
    hold on
    plot([-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o', 'LineStyle','--')
    %plot([-40 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o', 'LineStyle','--')

    plot([-50:10:40], [5 5 5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
    text(41, 5.01, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
    
    xlim([-50 40])
    xticks([-100 -80 -60 -40 -30 -20 -10 0 10 20 30])
    ylim([3.5, 6.5])
    yticks([3.5:0.5:6.5])
    %title(['Reference current vs Temperature'])
    xlabel("Temperature [$^{\circ}$C]")
    ylabel("Reference current [$\mu$A]")
    set(gcf, 'Color', 'w');
    set(gca,'fontname','Computer Modern') 
    grid on
    legend('TT (simulated)', 'FF (simulated)', 'SS (simulated)', sprintf('BBB = $(%s)_{2}$', bits(i)), 'Location','northeastoutside')
    savefig(sprintf('fig/BGR_current_Xtemp_%s.fig', bits(i)))
    exportgraphics(gcf,sprintf('pdf/BGR_current_Xtemp_%s.pdf',bits(i)),'ContentType','vector');
end


%% BGR current vs temperature (per BBB bits configuration) [Only TT simulation]

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve');

X = [1:1:8];
BGR_R = 18000; % R = 20kohm
BGR_gain = 4; % BGR gain
BGR_current_30C = ((D.("30C")/BGR_R)/BGR_gain)*1000
BGR_current_20C = ((D.("20C")/BGR_R)/BGR_gain)*1000
BGR_current_10C = ((D.("10C")/BGR_R)/BGR_gain)*1000
BGR_current_0C = ((D.("0C")/BGR_R)/BGR_gain)*1000
BGR_current_m10C = ((D.("-10C")/BGR_R)/BGR_gain)*1000
BGR_current_m20C = ((D.("-20C")/BGR_R)/BGR_gain)*1000
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m32C = ((D.("-32C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m34C = ((D.("-34C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m36C = ((D.("-36C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m38C = ((D.("-38C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

BGR_tot = [BGR_current_m40C, BGR_current_m38C,  BGR_current_m36C,  BGR_current_m34C,  BGR_current_m32C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];
%BGR_tot = [BGR_current_m40C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];

bits = ["000", "001", "010", "011", "100", "101", "110", "111"];

% all BBB bits configuration in different plots
for i=1:8
    figure('visible','on');
    plot([-40, 0, 27], [5.012, 5.004, 4.990], '-*', 'LineStyle','--') % TT
    hold on
    %plot([-40 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o', 'LineStyle','--')
    plot([-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o', 'LineStyle','--')
    plot([-50:10:40], [5 5 5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
    text(41, 5.01, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')

    xlim([-50 40])
    xticks([-100 -80 -60 -40 -30 -20 -10 0 10 20 30])
    %title(['Reference current vs Temperature'])
    xlabel("Temperature [$^{\circ}$C]")
    ylabel("Reference current [$\mu$A]")
    set(gcf, 'Color', 'w');
    set(gca,'fontname','Computer Modern') 
    grid on
    legend('TT (simulated)', sprintf('BBB = $(%s)_{2}$', bits(i)), 'Location','eastoutside')
    savefig(sprintf('fig/BGR_current_Xtemp_%s_TT.fig', bits(i)))
    exportgraphics(gcf,sprintf('pdf/BGR_current_Xtemp_%s_TT.pdf',bits(i)),'ContentType','vector');
end


%% BGR current vs temperature (all BBB bits configurations)

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve');

X = [1:1:8];
BGR_R = 18000; % R = 20kohm
BGR_gain = 4; % BGR gain
BGR_current_30C = ((D.("30C")/BGR_R)/BGR_gain)*1000
BGR_current_20C = ((D.("20C")/BGR_R)/BGR_gain)*1000
BGR_current_10C = ((D.("10C")/BGR_R)/BGR_gain)*1000
BGR_current_0C = ((D.("0C")/BGR_R)/BGR_gain)*1000
BGR_current_m10C = ((D.("-10C")/BGR_R)/BGR_gain)*1000
BGR_current_m20C = ((D.("-20C")/BGR_R)/BGR_gain)*1000
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m32C = ((D.("-32C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m34C = ((D.("-34C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m36C = ((D.("-36C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m38C = ((D.("-38C")/BGR_R)/BGR_gain)*1000 % TODO
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

%BGR_tot = [BGR_current_m40C,  BGR_current_m38C,  BGR_current_m36C,  BGR_current_m34C,  BGR_current_m32C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];
BGR_tot = [BGR_current_m40C, BGR_current_m30C, BGR_current_m20C, BGR_current_m10C, BGR_current_0C, BGR_current_10C, BGR_current_20C, BGR_current_30C];

bits = ["000", "001", "010", "011", "100", "101", "110", "111"];

plot([-40, 0, 27], [5.012, 5.004, 4.990], '-*', 'LineStyle', '--', Color=[0 1 0.5]) % TT
hold on
plot([-40, 0, 27], [5.761, 5.757, 5.744], '-*', 'LineStyle', '--', Color=[0.18 0.3 0.33]) % FF
hold on
%plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle', '--') % FS
hold on
%plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle', '--') % SF
hold on
plot([-40, 0, 27], [4.447, 4.432, 4.420], '-*', 'LineStyle', '--') % SS

% all BBB bits configuration in one single plot
hold on
for i=1:8
    hold on
    %plot([-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o')
    plot([-40 -30 -20 -10 0 10 20 30], BGR_tot(i, :), '-o')
end
plot([-50:10:40], [5 5 5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
text(32.5, 4.95, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
hold off

yticks([3.5:0.25:6])
xlim([-50 40])
xticks([ -40 -30 -20 -10 0 10 20 30])
xticklabels([ -40 -30 -20 -10 0 10 20 30])
%title('Reference current vs Temperature')
xlabel("Temperature [$^{\circ}$C]")
ylabel("Reference current [$\mu$A]", 'Interpreter','latex')
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('TT (simulated)', 'FF (simulated)', 'SS (simulated)', 'BBB = $(000)_{2}$', 'BBB = $(001)_{2}$', 'BBB = $(010)_{2}$', 'BBB = $(011)_{2}$', 'BBB = $(100)_{2}$', 'BBB = $(101)_{2}$', 'BBB = $(110)_{2}$', 'BBB = $(111)_{2}$', 'Location','eastoutside')
savefig('fig/BGR_current_Xtemp_all-BBB.fig')
exportgraphics(gcf,'pdf/BGR_current_Xtemp_all-BBB.pdf','ContentType','vector');


%% BGR current vs BBB bits (variating temperature) [-40$^{\circ}$C to -30$^{\circ}$C]

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve');

X = [1:1:8];
BGR_R = 18000; % R = 20kohm
BGR_gain = 4; % BGR gain
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m32C = ((D.("-32C")/BGR_R)/BGR_gain)*1000
BGR_current_m34C = ((D.("-34C")/BGR_R)/BGR_gain)*1000
BGR_current_m36C = ((D.("-36C")/BGR_R)/BGR_gain)*1000
BGR_current_m38C = ((D.("-38C")/BGR_R)/BGR_gain)*1000
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

hold on
plot(X, BGR_current_m30C, '-o', X, BGR_current_m32C, '-o', X, BGR_current_m34C, '-o', X, BGR_current_m36C, '-o', X, BGR_current_m38C, '-o', X, BGR_current_m40C, '-o')
plot([1:8], [5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
text(8.1, 5.01, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
hold off
box
%title('Reference current vs Bias setting')
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
xlabel("Bias setting")
ylabel("Reference current [$\mu$A]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('T = $-30°$C', 'T = $-32°$C', 'T = $-34°$C', 'T = $-36°$C', 'T = $-38°$C', 'T = $-40°$C', 'Location', 'southeast')
savefig('fig/BGR_current_XBBB_40-30.fig')
exportgraphics(gcf,'pdf/BGR_current_XBBB_40-30.pdf','ContentType','vector');


%% BGR current vs temperature (all BBB bits configurations) [-40$^{\circ}$C to -30$^{\circ}$C]

f = figure('visible','on');

clear; clc;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve');

X = [1:1:8];
BGR_R = 18000; % R = 20kohm
BGR_gain = 4; % BGR gain
BGR_current_m30C = ((D.("-30C")/BGR_R)/BGR_gain)*1000
BGR_current_m32C = ((D.("-32C")/BGR_R)/BGR_gain)*1000
BGR_current_m34C = ((D.("-34C")/BGR_R)/BGR_gain)*1000
BGR_current_m36C = ((D.("-36C")/BGR_R)/BGR_gain)*1000
BGR_current_m38C = ((D.("-38C")/BGR_R)/BGR_gain)*1000
BGR_current_m40C = ((D.("-40C")/BGR_R)/BGR_gain)*1000

BGR_tot = [BGR_current_m40C,  BGR_current_m38C,  BGR_current_m36C,  BGR_current_m34C,  BGR_current_m32C, BGR_current_m30C];

bits = ["000", "001", "010", "011", "100", "101", "110", "111"];

%plot([-40, 0, 27], [5.012, 5.004, 4.990], '-*', 'LineStyle', '--', Color=[0 1 0.5]) % TT
hold on
%plot([-40, 0, 27], [5.761, 5.757, 5.744], '-*', 'LineStyle', '--', Color=[0.18 0.3 0.33]) % FF
hold on
%plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle', '--') % FS
hold on
%plot([-40, 0, 27], [5.012, 5.004, 4.989], '-*', 'LineStyle', '--') % SF
hold on
%plot([-40, 0, 27], [4.447, 4.432, 4.420], '-*', 'LineStyle', '--') % SS

% all BBB bits configuration in one single plot
for i=1:8
    hold on
    plot([-40 -38 -36 -34 -32 -30], BGR_tot(i, :), '-o')
end
plot([-50:10:40], [5 5 5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
text(-29.4, 4.95, '5$\mu$A', 'Color', 'red','FontName','Computer Modern')
hold off
box
xlim([-42 -28])
yticks([3.5:0.25:5.5])
xticks([-40 -38 -36 -34 -32 -30 -28 -26 -24])
xticklabels([-40 -38 -36 -34 -32 -30])
%title('Reference current vs Temperature')
xlabel("Temperature [$^{\circ}$C]")
ylabel("Reference current [$\mu$A]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('BBB = $(000)_{2}$', 'BBB = $(001)_{2}$', 'BBB = $(010)_{2}$', 'BBB = $(011)_{2}$', 'BBB = $(100)_{2}$', 'BBB = $(101)_{2}]$', 'BBB = $(110)_{2}$', 'BBB = $(111)_{2}$', 'Location','eastoutside')
savefig('fig/BGR_current_Xtemp_all-BBB.fig')
exportgraphics(gcf,'pdf/BGR_current_Xtemp_all-BBB_40-30.pdf','ContentType','vector');
