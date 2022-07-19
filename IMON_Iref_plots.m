%% Upload data

clear; clc;
fontsize = 12;
D = readtable('BGR_data/test_board_measurements - 2_BGR_R3-18k.csv', 'VariableNamingRule','preserve'); % measurements data
SIM_IMON_Iref = readtable('BGR_data/IMON_IREF_vs_T_models.txt', 'Format','%f %f %f %f %f %f %f %f %f %f'); % simulations data

% BIAS	A	00	30	31	32	33	34	35	36	37	38	39
SIM_ASIC = readtable('BGR_data/current_ASIC_var.txt', 'Format','%f %f %f %f %f %f %f %f %f %f %f %f %f'); % simulations data

D_double = table2array(D);
SIM_IMON_Iref_double = table2array(SIM_IMON_Iref);
SIM_ASIC_double = table2array(SIM_ASIC);

X = [1:1:8];
BGR_R = 18000; % R = 18kohm
BGR_gain = 4; % BGR gain


%% Plot della Iref misurata su diversi ASIC vs bit setting (BBB)

f = figure('visible','on');

hold on
box
for i=1:11
    plot([1:8], SIM_ASIC_double(:, [i+2:end]), '-o')
end

% retta a 5uA per indicare valore di riferimento
plot([1:8], [5 5 5 5 5 5 5 5], 'LineStyle','-.', 'LineWidth', 1, 'Color', 'red')
text(8.1, 5, '5$\mu$A', 'Color', 'red', 'FontName', 'Computer Modern')
hold off


text(-1,4,'4 keV','Color','red','FontSize',14)
%title('Reference current vs Bias setting')
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
yticks([3.5:0.5:6])
xlabel("Bias setting")
ylabel("IMON/4 [$\mu$A]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('00', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', 'Location','southeast','NumColumns',2)

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 

savefig('fig/BGR_current_11ASIC_XBBB.fig')
exportgraphics(gcf,'pdf/BGR_current_11ASIC_XBBB.pdf','ContentType','vector');


%% Plot dei dati dopo il binning per le due sole configurazioni 101 e 110 [misure 11 ASIC]

f = figure('visible','on');

hold on
data_101 = SIM_ASIC_double(6, 3:end);
plot_101 = histfit(data_101, 4)
dist_101 = fitdist(data_101', "normal")
set(plot_101(2), 'color', 'blue')
set(plot_101(1),'FaceAlpha',.25);
set(plot_101(2), 'LineWidth', 1);


data_110 = SIM_ASIC_double(7, 3:end);
plot_110 = histfit(data_110, 4)
dist_110 = fitdist(data_110', "normal")
set(plot_110(2), 'color', 'red')
set(plot_110(1),'FaceColor', 'red');
set(plot_110(1),'FaceAlpha',.25);
set(plot_110(2), 'LineWidth', 1);
hold off

box
legend(['BBB = $(101)_{2}$, $\mu$ = ', sprintf('%.3f', dist_101.mu), '$\mu$A'], '', ['BBB = $(110)_{2}$, $\mu$ = ', sprintf('%.3f', dist_110.mu), '$\mu$A'])
ylim([0, 7])
xlim([4.7 5.5])
xticks([4.7:0.1:5.5])
xticklabels([4.7:0.1:5.5])
xlabel('Reference current [$\mu$A]')
ylabel('Entries')
ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 

%title({'Reference current values distribution', ' for BBB = (101)_2 and BBB = (110)_2'})
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

savefig('fig/BGR_current_101_110_binning.fig')
exportgraphics(gcf,'pdf/BGR_current_101_110_binning.pdf','ContentType','vector');


%% Plot della Iref misurata vs bit setting (BBB) ma per le diverse temperature

% già plottata in BGR_plots


%% Plot della Iref normalizzata (al valore a 0 °C) vs Temperatura. [IMON/4]
% Su questo plot metterei 4 curve: misurata, simulata TT, SS e FF

f = figure('visible','on');

V_0C = flip([D_double(6, 2:8) D_double(6, 13)]); % corrente misurata in tensione (TBBB = 0101)
I_0C = ((V_0C/BGR_gain)/BGR_R)*1000; % corrente misurata a 0°C in uA (0101)

% corrente misurata normalizzata
I_0C_norm = I_0C./I_0C(5);

% correnti simulate normalizzate
I_TT = SIM_IMON_Iref_double(:, 3)./SIM_IMON_Iref_double(5, 3)
I_SS = SIM_IMON_Iref_double(:, 6)./SIM_IMON_Iref_double(5, 6)
I_FF = SIM_IMON_Iref_double(:, 9)./SIM_IMON_Iref_double(5, 9)

X = [-40:10:30];

hold on
plot(X, I_0C_norm, '-o') % misurata a 0°C 
plot(X, I_TT, '-*')
plot(X, I_SS, '-*')
plot(X, I_FF, '-*')
hold off

box
legend('Measured IMON/4', 'IMON/4 (TT)', 'IMON/4 (SS)', 'IMON/4 (FF)')
%title('Normalised reference current vs Temperature')
ylabel('Reference current')
xlabel("Temperature [$^{\circ}$C]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 

savefig('fig/BGR_current_normal_IMON.fig')
exportgraphics(gcf,'pdf/BGR_current_normal_IMON.pdf','ContentType','vector');


%% Plot della Iref normalizzata (al valore a 0 °C) vs Temperatura. [Iref]
% Su questo plot metterei 4 curve: misurata, simulata TT, SS e FF

f = figure('visible','on');

V_0C = flip([D_double(6, 2:8) D_double(6, 13)]); % corrente misurata in tensione (TBBB = 0101)
I_0C = ((V_0C/BGR_gain)/BGR_R)*1000; % corrente misurata a 0°C in uA (0101)

% corrente misurata normalizzata
I_0C_norm = I_0C./I_0C(5);

% correnti simulate normalizzate
I_TT = SIM_IMON_Iref_double(:, 4)./SIM_IMON_Iref_double(5, 4)
I_SS = SIM_IMON_Iref_double(:, 7)./SIM_IMON_Iref_double(5, 7)
I_FF = SIM_IMON_Iref_double(:, 10)./SIM_IMON_Iref_double(5, 10)

X = [-40:10:30];

hold on
plot(X, I_0C_norm, '-o') % misurata a 0°C 
plot(X, I_TT, '-*')
plot(X, I_SS, '-*')
plot(X, I_FF, '-*')
hold off

box
legend('Measured Iref', 'Simulated Iref (TT)', 'Simulated Iref (SS)', 'Simulated Iref (FF)')
%title('Normalised reference current vs Temperature')
ylabel('Normalised reference current')
xlabel("Temperature [$^{\circ}$C]")
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 

savefig('fig/BGR_current_normal_Iref.fig')
exportgraphics(gcf,'pdf/BGR_current_normal_Iref.pdf','ContentType','vector');
