%% Transfer function [TransferFunctionXXY.dat]

clear; clc;
fontsize = 12;

% data acquisition
T_30A = readtable('MODULE_003/TransferFunction30A.dat', 'VariableNamingRule','preserve');
T_20A = readtable('MODULE_003/TransferFunction20A.dat', 'VariableNamingRule','preserve'); 
T_10A = readtable('MODULE_003/TransferFunction10A.dat', 'VariableNamingRule','preserve'); 
T_0A = readtable('MODULE_003/TransferFunction0A.dat', 'VariableNamingRule','preserve'); 
T_m10A = readtable('MODULE_003/TransferFunction-10A.dat', 'VariableNamingRule','preserve'); 
T_m20A = readtable('MODULE_003/TransferFunction-20A.dat', 'VariableNamingRule','preserve'); 
T_m30A = readtable('MODULE_003/TransferFunction-30A.dat', 'VariableNamingRule','preserve'); 
T_m32A = readtable('MODULE_003/TransferFunction-32A.dat', 'VariableNamingRule','preserve');
T_m34A = readtable('MODULE_003/TransferFunction-34A.dat', 'VariableNamingRule','preserve');
T_m36A = readtable('MODULE_003/TransferFunction-36A.dat', 'VariableNamingRule','preserve');
T_m38A = readtable('MODULE_003/TransferFunction-38A.dat', 'VariableNamingRule','preserve');
T_m40A = readtable('MODULE_003/TransferFunction-40A.dat', 'VariableNamingRule','preserve'); 

T_30B = readtable('MODULE_003/TransferFunction30B.dat', 'VariableNamingRule','preserve'); 
T_20B = readtable('MODULE_003/TransferFunction20B.dat', 'VariableNamingRule','preserve'); 
T_10B = readtable('MODULE_003/TransferFunction10B.dat', 'VariableNamingRule','preserve');
T_0B = readtable('MODULE_003/TransferFunction0B.dat', 'VariableNamingRule','preserve'); 
T_m10B = readtable('MODULE_003/TransferFunction-10B.dat', 'VariableNamingRule','preserve');
T_m20B = readtable('MODULE_003/TransferFunction-20B.dat', 'VariableNamingRule','preserve'); 
T_m30B = readtable('MODULE_003/TransferFunction-30B.dat', 'VariableNamingRule','preserve'); 
T_m32B = readtable('MODULE_003/TransferFunction-32B.dat', 'VariableNamingRule','preserve');
T_m34B = readtable('MODULE_003/TransferFunction-34B.dat', 'VariableNamingRule','preserve');
T_m36B = readtable('MODULE_003/TransferFunction-36B.dat', 'VariableNamingRule','preserve');
T_m38B = readtable('MODULE_003/TransferFunction-38B.dat', 'VariableNamingRule','preserve');
T_m40B = readtable('MODULE_003/TransferFunction-40B.dat', 'VariableNamingRule','preserve');

T_30C = readtable('MODULE_004/TransferFunction30C.dat', 'VariableNamingRule','preserve'); % REPEATED MEASURE
T_20C = readtable('MODULE_004/TransferFunction20C.dat', 'VariableNamingRule','preserve'); 
T_10C = readtable('MODULE_004/TransferFunction10C.dat', 'VariableNamingRule','preserve');
T_0C = readtable('MODULE_004/TransferFunction0C.dat', 'VariableNamingRule','preserve'); 
T_m10C = readtable('MODULE_004/TransferFunction-10C.dat', 'VariableNamingRule','preserve');
T_m20C = readtable('MODULE_004/TransferFunction-20C.dat', 'VariableNamingRule','preserve'); 
T_m30C = readtable('MODULE_004/TransferFunction-30C.dat', 'VariableNamingRule','preserve'); 
T_m32C = readtable('MODULE_004/TransferFunction-32C.dat', 'VariableNamingRule','preserve'); % REPEATED MEASURE
T_m34C = readtable('MODULE_004/TransferFunction-34C.dat', 'VariableNamingRule','preserve'); % REPEATED MEASURE
T_m36C = readtable('MODULE_004/TransferFunction-36C.dat', 'VariableNamingRule','preserve');
T_m38C = readtable('MODULE_004/TransferFunction-38C.dat', 'VariableNamingRule','preserve');
T_m40C = readtable('MODULE_004/TransferFunction-40C.dat', 'VariableNamingRule','preserve');

% conversion
T1_30A = table2array(T_30A);
T1_20A = table2array(T_20A);
T1_10A = table2array(T_10A);
T1_0A = table2array(T_0A);
T1_m10A = table2array(T_m10A);
T1_m20A = table2array(T_m20A);
T1_m30A = table2array(T_m30A);
T1_m32A = table2array(T_m32A);
T1_m34A = table2array(T_m34A);
T1_m36A = table2array(T_m36A);
T1_m38A = table2array(T_m38A);
T1_m40A = table2array(T_m40A);

T1_30B = table2array(T_30B);
T1_20B = table2array(T_20B);
T1_10B = table2array(T_10B);
T1_0B = table2array(T_0B);
T1_m10B = table2array(T_m10B);
T1_m20B = table2array(T_m20B);
T1_m30B = table2array(T_m30B);
T1_m32B = table2array(T_m32B);
T1_m34B = table2array(T_m34B);
T1_m36B = table2array(T_m36B);
T1_m38B = table2array(T_m38B);
T1_m40B = table2array(T_m40B);

T1_30C = table2array(T_30C);
T1_20C = table2array(T_20C);
T1_10C = table2array(T_10C);
T1_0C = table2array(T_0C);
T1_m10C = table2array(T_m10C);
T1_m20C = table2array(T_m20C);
T1_m30C = table2array(T_m30C);
T1_m32C = table2array(T_m32C);
T1_m34C = table2array(T_m34C);
T1_m36C = table2array(T_m36C);
T1_m38C = table2array(T_m38C);
T1_m40C = table2array(T_m40C);

% init
T_tab_30A = nan(255,55);
T_tab_20A = nan(255,55);
T_tab_10A = nan(255,55);
T_tab_0A = nan(255,55);
T_tab_m10A = nan(255,55);
T_tab_m20A = nan(255,55);
T_tab_m30A = nan(255,55);
T_tab_m32A = nan(255,55);
T_tab_m34A = nan(255,55);
T_tab_m36A = nan(255,55);
T_tab_m38A = nan(255,55);
T_tab_m40A = nan(255,55);

T_tab_30B = nan(255,55);
T_tab_20B = nan(255,55);
T_tab_10B = nan(255,55);
T_tab_0B = nan(255,55);
T_tab_m10B = nan(255,55);
T_tab_m20B = nan(255,55);
T_tab_m30B = nan(255,55);
T_tab_m32B = nan(255,55);
T_tab_m34B = nan(255,55);
T_tab_m36B = nan(255,55);
T_tab_m38B = nan(255,55);
T_tab_m40B = nan(255,55);

T_tab_30C = nan(255,55);
T_tab_20C = nan(255,55);
T_tab_10C = nan(255,55);
T_tab_0C = nan(255,55);
T_tab_m10C = nan(255,55);
T_tab_m20C = nan(255,55);
T_tab_m30C = nan(255,55);
T_tab_m32C = nan(255,55);
T_tab_m34C = nan(255,55);
T_tab_m36C = nan(255,55);
T_tab_m38C = nan(255,55);
T_tab_m40C = nan(255,55);

tau = 4;

% X in DAC code
X = table2array(T_30A([1:55], 3));
X = X';

% conversion DAC -> keV
X_keV = X*0.841;

count = 1;
for i=1:55:14025
    for j=0:54
        if T1_30A(i, 2) == tau
            % format
            T_tab_30A(count,j+1) = T1_30A(i+j, 4);
            T_tab_20A(count,j+1) = T1_20A(i+j, 4);
            T_tab_10A(count,j+1) = T1_10A(i+j, 4);
            T_tab_0A(count,j+1) = T1_0A(i+j, 4);
            T_tab_m10A(count,j+1) = T1_m10A(i+j, 4);
            T_tab_m20A(count,j+1) = T1_m20A(i+j, 4);
            T_tab_m30A(count,j+1) = T1_m30A(i+j, 4);
            T_tab_m32A(count,j+1) = T1_m32A(i+j, 4);
            T_tab_m34A(count,j+1) = T1_m34A(i+j, 4);
            T_tab_m36A(count,j+1) = T1_m36A(i+j, 4);
            T_tab_m38A(count,j+1) = T1_m38A(i+j, 4);
            T_tab_m40A(count,j+1) = T1_m40A(i+j, 4);

            T_tab_30B(count,j+1) = T1_30B(i+j, 4);
            T_tab_20B(count,j+1) = T1_20B(i+j, 4);
            T_tab_10B(count,j+1) = T1_10B(i+j, 4);
            T_tab_0B(count,j+1) = T1_0B(i+j, 4);
            T_tab_m10B(count,j+1) = T1_m10B(i+j, 4);
            T_tab_m20B(count,j+1) = T1_m20B(i+j, 4);
            T_tab_m30B(count,j+1) = T1_m30B(i+j, 4);
            T_tab_m32B(count,j+1) = T1_m32B(i+j, 4);
            T_tab_m34B(count,j+1) = T1_m34B(i+j, 4);
            T_tab_m36B(count,j+1) = T1_m36B(i+j, 4);
            T_tab_m38B(count,j+1) = T1_m38B(i+j, 4);
            T_tab_m40B(count,j+1) = T1_m40B(i+j, 4);

            T_tab_30C(count,j+1) = T1_30C(i+j, 4);
            T_tab_20C(count,j+1) = T1_20C(i+j, 4);
            T_tab_10C(count,j+1) = T1_10C(i+j, 4);
            T_tab_0C(count,j+1) = T1_0C(i+j, 4);
            T_tab_m10C(count,j+1) = T1_m10C(i+j, 4);
            T_tab_m20C(count,j+1) = T1_m20C(i+j, 4);
            T_tab_m30C(count,j+1) = T1_m30C(i+j, 4);
            T_tab_m32C(count,j+1) = T1_m32C(i+j, 4);
            T_tab_m34C(count,j+1) = T1_m34C(i+j, 4);
            T_tab_m36C(count,j+1) = T1_m36C(i+j, 4);
            T_tab_m38C(count,j+1) = T1_m38C(i+j, 4);
            T_tab_m40C(count,j+1) = T1_m40C(i+j, 4);
        end
    end
    count = count + 1;
end

% mean
T_tab_30A_mean = nanmean(T_tab_30A);
T_tab_20A_mean = nanmean(T_tab_20A);
T_tab_10A_mean = nanmean(T_tab_10A);
T_tab_0A_mean = nanmean(T_tab_0A);
T_tab_m10A_mean = nanmean(T_tab_m10A);
T_tab_m20A_mean = nanmean(T_tab_m20A);
T_tab_m30A_mean = nanmean(T_tab_m30A);
T_tab_m32A_mean = nanmean(T_tab_m32A);
T_tab_m34A_mean = nanmean(T_tab_m34A);
T_tab_m36A_mean = nanmean(T_tab_m36A);
T_tab_m38A_mean = nanmean(T_tab_m38A);
T_tab_m40A_mean = nanmean(T_tab_m40A);

T_tab_30B_mean = nanmean(T_tab_30B);
T_tab_20B_mean = nanmean(T_tab_20B);
T_tab_10B_mean = nanmean(T_tab_10B);
T_tab_0B_mean = nanmean(T_tab_0B);
T_tab_m10B_mean = nanmean(T_tab_m10B);
T_tab_m20B_mean = nanmean(T_tab_m20B);
T_tab_m30B_mean = nanmean(T_tab_m30B);
T_tab_m32B_mean = nanmean(T_tab_m32B);
T_tab_m34B_mean = nanmean(T_tab_m34B);
T_tab_m36B_mean = nanmean(T_tab_m36B);
T_tab_m38B_mean = nanmean(T_tab_m38B);
T_tab_m40B_mean = nanmean(T_tab_m40B);

T_tab_30C_mean = nanmean(T_tab_30C);
T_tab_20C_mean = nanmean(T_tab_20C);
T_tab_10C_mean = nanmean(T_tab_10C);
T_tab_0C_mean = nanmean(T_tab_0C);
T_tab_m10C_mean = nanmean(T_tab_m10C);
T_tab_m20C_mean = nanmean(T_tab_m20C);
T_tab_m30C_mean = nanmean(T_tab_m30C);
T_tab_m32C_mean = nanmean(T_tab_m32C);
T_tab_m34C_mean = nanmean(T_tab_m34C);
T_tab_m36C_mean = nanmean(T_tab_m36C);
T_tab_m38C_mean = nanmean(T_tab_m38C);
T_tab_m40C_mean = nanmean(T_tab_m40C);

% std for errorbars
T_tab_30A_std = nanstd(T_tab_30A);
T_tab_20A_std = nanstd(T_tab_20A);
T_tab_10A_std = nanstd(T_tab_10A);
T_tab_0A_std = nanstd(T_tab_0A);
T_tab_m10A_std = nanstd(T_tab_m10A);
T_tab_m20A_std = nanstd(T_tab_m20A);
T_tab_m30A_std = nanstd(T_tab_m30A);
T_tab_m32A_std = nanstd(T_tab_m32A);
T_tab_m34A_std = nanstd(T_tab_m34A);
T_tab_m36A_std = nanstd(T_tab_m36A);
T_tab_m38A_std = nanstd(T_tab_m38A);
T_tab_m40A_std = nanstd(T_tab_m40A);

T_tab_30B_std = nanstd(T_tab_30B);
T_tab_20B_std = nanstd(T_tab_20B);
T_tab_10B_std = nanstd(T_tab_10B);
T_tab_0B_std = nanstd(T_tab_0B);
T_tab_m10B_std = nanstd(T_tab_m10B);
T_tab_m20B_std = nanstd(T_tab_m20B);
T_tab_m30B_std = nanstd(T_tab_m30B);
T_tab_m32B_std = nanstd(T_tab_m32B);
T_tab_m34B_std = nanstd(T_tab_m34B);
T_tab_m36B_std = nanstd(T_tab_m36B);
T_tab_m38B_std = nanstd(T_tab_m38B);
T_tab_m40B_std = nanstd(T_tab_m40B);

T_tab_30C_std = nanstd(T_tab_30C);
T_tab_20C_std = nanstd(T_tab_20C);
T_tab_10C_std = nanstd(T_tab_10C);
T_tab_0C_std = nanstd(T_tab_0C);
T_tab_m10C_std = nanstd(T_tab_m10C);
T_tab_m20C_std = nanstd(T_tab_m20C);
T_tab_m30C_std = nanstd(T_tab_m30C);
T_tab_m32C_std = nanstd(T_tab_m32C);
T_tab_m34C_std = nanstd(T_tab_m34C);
T_tab_m36C_std = nanstd(T_tab_m36C);
T_tab_m38C_std = nanstd(T_tab_m38C);
T_tab_m40C_std = nanstd(T_tab_m40C);

% remove first two decades errorbars
T_tab_30A_std(1:23) = nan;
T_tab_20A_std(1:23) = nan;
T_tab_10A_std(1:23) = nan;
T_tab_0A_std(1:23) = nan;
T_tab_m10A_std(1:23) = nan;
T_tab_m20A_std(1:23) = nan;
T_tab_m30A_std(1:23) = nan;
T_tab_m32A_std(1:23) = nan;
T_tab_m34A_std(1:23) = nan;
T_tab_m36A_std(1:23) = nan;
T_tab_m38A_std(1:23) = nan;
T_tab_m40A_std(1:23) = nan;

T_tab_30B_std(1:23) = nan;
T_tab_20B_std(1:23) = nan;
T_tab_10B_std(1:23) = nan;
T_tab_0B_std(1:23) = nan;
T_tab_m10B_std(1:23) = nan;
T_tab_m20B_std(1:23) = nan;
T_tab_m30B_std(1:23) = nan;
T_tab_m32B_std(1:23) = nan;
T_tab_m34B_std(1:23) = nan;
T_tab_m36B_std(1:23) = nan;
T_tab_m38B_std(1:23) = nan;
T_tab_m40B_std(1:23) = nan;

T_tab_30C_std(1:23) = nan;
T_tab_20C_std(1:23) = nan;
T_tab_10C_std(1:23) = nan;
T_tab_0C_std(1:23) = nan;
T_tab_m10C_std(1:23) = nan;
T_tab_m20C_std(1:23) = nan;
T_tab_m30C_std(1:23) = nan;
T_tab_m32C_std(1:23) = nan;
T_tab_m34C_std(1:23) = nan;
T_tab_m36C_std(1:23) = nan;
T_tab_m38C_std(1:23) = nan;
T_tab_m40C_std(1:23) = nan;

% odd and even errobars for 
T_tab_30A_std(1:2:end) = nan;
T_tab_20A_std(2:2:end) = nan;
T_tab_10A_std(1:2:end) = nan;
T_tab_0A_std(2:2:end) = nan;
T_tab_m10A_std(1:2:end) = nan;
T_tab_m20A_std(2:2:end) = nan;
T_tab_m30A_std(1:2:end) = nan;
T_tab_m32A_std(2:2:end) = nan;
T_tab_m34A_std(1:2:end) = nan;
T_tab_m36A_std(2:2:end) = nan;
T_tab_m38A_std(1:2:end) = nan;
T_tab_m40A_std(2:2:end) = nan;

T_tab_30B_std(1:2:end) = nan;
T_tab_20B_std(2:2:end) = nan;
T_tab_10B_std(1:2:end) = nan;
T_tab_0B_std(2:2:end) = nan;
T_tab_m10B_std(1:2:end) = nan;
T_tab_m20B_std(2:2:end) = nan;
T_tab_m30B_std(1:2:end) = nan;
T_tab_m32B_std(2:2:end) = nan;
T_tab_m34B_std(1:2:end) = nan;
T_tab_m36B_std(2:2:end) = nan;
T_tab_m38B_std(1:2:end) = nan;
T_tab_m40B_std(2:2:end) = nan;

T_tab_30C_std(1:2:end) = nan;
T_tab_20C_std(2:2:end) = nan;
T_tab_10C_std(1:2:end) = nan;
T_tab_0C_std(2:2:end) = nan;
T_tab_m10C_std(1:2:end) = nan;
T_tab_m20C_std(2:2:end) = nan;
T_tab_m30C_std(1:2:end) = nan;
T_tab_m32C_std(2:2:end) = nan;
T_tab_m34C_std(1:2:end) = nan;
T_tab_m36C_std(2:2:end) = nan;
T_tab_m38C_std(1:2:end) = nan;
T_tab_m40C_std(2:2:end) = nan;


%% errorbar plot TDF CSAVrefGM: auto [X axis: DAC code] [HRRR = 0011]

f = figure('visible','off');


hold on
errorbar(X(1:55), T_tab_30A_mean, T_tab_30A_std)
hold on;
errorbar(X(1:55), T_tab_20A_mean, T_tab_20A_std)
hold on;
errorbar(X(1:55), T_tab_10A_mean, T_tab_10A_std)
hold on;
errorbar(X(1:55), T_tab_0A_mean, T_tab_0A_std)
hold on;
errorbar(X(1:55), T_tab_m10A_mean, T_tab_m10A_std)
hold on;
errorbar(X(1:55), T_tab_m20A_mean, T_tab_m20A_std)
hold on;
errorbar(X(1:55), T_tab_m30A_mean, T_tab_m30A_std)
hold on;
errorbar(X(1:55), T_tab_m40A_mean, T_tab_m40A_std)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

[leg,att] = legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')
title(leg,'Temperature')
leg.Title.Visible = 'on';

savefig(sprintf('fig/errbar_fdt_csavrefgm_auto_tau%d_DAC_0011.fig', tau))
exportgraphics(gcf, sprintf('pdf/errbar_fdt_csavrefgm_auto_tau%d_DAC_0011.pdf', tau),'ContentType','vector');


%% errorbar plot TDF CSAVrefGM: auto [X axis: DAC code] [HRRR = 0111]

f = figure('visible','off');

box
hold on
errorbar(X(1:55), T_tab_30C_mean, T_tab_30C_std)
hold on;
errorbar(X(1:55), T_tab_20C_mean, T_tab_20C_std)
hold on;
errorbar(X(1:55), T_tab_10C_mean, T_tab_10C_std)
hold on;
errorbar(X(1:55), T_tab_0C_mean, T_tab_0C_std)
hold on;
errorbar(X(1:55), T_tab_m10C_mean, T_tab_m10C_std)
hold on;
errorbar(X(1:55), T_tab_m20C_mean, T_tab_m20C_std)
hold on;
errorbar(X(1:55), T_tab_m30C_mean, T_tab_m30C_std)
hold on;
errorbar(X(1:55), T_tab_m40C_mean, T_tab_m40C_std)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig(sprintf('fig/errbar_fdt_csavrefgm_auto_tau%d_DAC_0111.fig', tau))
exportgraphics(gcf, sprintf('pdf/errbar_fdt_csavrefgm_auto_tau%d_DAC_0111.pdf', tau),'ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: DAC code] [HRRR = 0011]

f = figure('visible','off');

box
hold on
plot(X(1:55), T_tab_30A_mean)
hold on;
plot(X(1:55), T_tab_20A_mean)
hold on;
plot(X(1:55), T_tab_10A_mean)
hold on;
plot(X(1:55), T_tab_0A_mean)
hold on;
plot(X(1:55), T_tab_m10A_mean)
hold on;
plot(X(1:55), T_tab_m20A_mean)
hold on;
plot(X(1:55), T_tab_m30A_mean)
hold on;
plot(X(1:55), T_tab_m40A_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
yticks([0:200:2000])
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_DAC_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: DAC code] [HRRR = 0111]

f = figure('visible','off');

box
hold on
plot(X(1:55), T_tab_30C_mean)
hold on;
plot(X(1:55), T_tab_20C_mean)
hold on;
plot(X(1:55), T_tab_10C_mean)
hold on;
plot(X(1:55), T_tab_0C_mean)
hold on;
plot(X(1:55), T_tab_m10C_mean)
hold on;
plot(X(1:55), T_tab_m20C_mean)
hold on;
plot(X(1:55), T_tab_m30C_mean)
hold on;
plot(X(1:55), T_tab_m40C_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
yticks([0:200:2000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_DAC_0111.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_0111.pdf','ContentType','vector');


%% errorbar plot TDF CSAVrefGM: fixed @ 530mV [X axis: DAC code]

f = figure('visible','off');

box
hold on
errorbar(X(1:55), T_tab_30B_mean, T_tab_30A_std)
hold on;
errorbar(X(1:55), T_tab_20B_mean, T_tab_20B_std)
hold on;
errorbar(X(1:55), T_tab_10B_mean, T_tab_10B_std)
hold on;
errorbar(X(1:55), T_tab_0B_mean, T_tab_0B_std)
hold on;
errorbar(X(1:55), T_tab_m10B_mean, T_tab_m10B_std)
hold on;
errorbar(X(1:55), T_tab_m20B_mean, T_tab_m20B_std)
hold on;
errorbar(X(1:55), T_tab_m30B_mean, T_tab_m30B_std)
hold on;
errorbar(X(1:55), T_tab_m40B_mean, T_tab_m40B_std)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/errbar_fdt_csavrefgm_530mV_tau6_DAC.fig')
exportgraphics(gcf,'pdf/errbar_fdt_csavrefgm_530mV_tau6_DAC.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: fixed @ 530mV [X axis: DAC code]

f = figure('visible','off');

box
hold on
plot(X(1:55), T_tab_30B_mean)
hold on;
plot(X(1:55), T_tab_20B_mean)
hold on;
plot(X(1:55), T_tab_10B_mean)
hold on;
plot(X(1:55), T_tab_0B_mean)
hold on;
plot(X(1:55), T_tab_m10B_mean)
hold on;
plot(X(1:55), T_tab_m20B_mean)
hold on;
plot(X(1:55), T_tab_m30B_mean)
hold on;
plot(X(1:55), T_tab_m40B_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_530mV_tau6_DAC.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_530mV_tau6_DAC.pdf','ContentType','vector');


%% errorbar plot TDF CSAVrefGM: auto [X axis: keV] [HRRR = 0011]

f = figure('visible','off');

box
hold on
errorbar(X_keV(1:55), T_tab_30A_mean, T_tab_30A_std)
hold on;
errorbar(X_keV(1:55), T_tab_20A_mean, T_tab_20A_std)
hold on;
errorbar(X_keV(1:55), T_tab_10A_mean, T_tab_10A_std)
hold on;
errorbar(X_keV(1:55), T_tab_0A_mean, T_tab_0A_std)
hold on;
errorbar(X_keV(1:55), T_tab_m10A_mean, T_tab_m10A_std)
hold on;
errorbar(X_keV(1:55), T_tab_m20A_mean, T_tab_m20A_std)
hold on;
errorbar(X_keV(1:55), T_tab_m30A_mean, T_tab_m30A_std)
hold on;
errorbar(X_keV(1:55), T_tab_m40A_mean, T_tab_m40A_std)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('Incoming energy [keV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/errbar_fdt_csavrefgm_auto_tau6_keV_0011.fig')
exportgraphics(gcf,'pdf/errbar_fdt_csavrefgm_auto_tau6_keV_0011.pdf','ContentType','vector');


%% errorbar plot TDF CSAVrefGM: auto [X axis: keV] [HRRR = 0111]

f = figure('visible','off');

box
hold on
errorbar(X_keV(1:55), T_tab_30C_mean, T_tab_30C_std)
hold on;
errorbar(X_keV(1:55), T_tab_20C_mean, T_tab_20C_std)
hold on;
errorbar(X_keV(1:55), T_tab_10C_mean, T_tab_10C_std)
hold on;
errorbar(X_keV(1:55), T_tab_0C_mean, T_tab_0C_std)
hold on;
errorbar(X_keV(1:55), T_tab_m10C_mean, T_tab_m10C_std)
hold on;
errorbar(X_keV(1:55), T_tab_m20C_mean, T_tab_m20C_std)
hold on;
errorbar(X_keV(1:55), T_tab_m30C_mean, T_tab_m30C_std)
hold on;
errorbar(X_keV(1:55), T_tab_m40C_mean, T_tab_m40C_std)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('Incoming energy [keV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/errbar_fdt_csavrefgm_auto_tau6_keV_0111.fig')
exportgraphics(gcf,'pdf/errbar_fdt_csavrefgm_auto_tau6_keV_0111.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: keV] [HRRR = 0011]

f = figure('visible','off');

box 
hold on
plot(X_keV(1:55), T_tab_30A_mean)
hold on;
plot(X_keV(1:55), T_tab_20A_mean)
hold on;
plot(X_keV(1:55), T_tab_10A_mean)
hold on;
plot(X_keV(1:55), T_tab_0A_mean)
hold on;
plot(X_keV(1:55), T_tab_m10A_mean)
hold on;
plot(X_keV(1:55), T_tab_m20A_mean)
hold on;
plot(X_keV(1:55), T_tab_m30A_mean)
hold on;
plot(X_keV(1:55), T_tab_m40A_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
yticks([0:200:2000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_keV_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_keV_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: keV] [HRRR = 0111]

f = figure('visible','off');

box
hold on
plot(X_keV(1:55), T_tab_30C_mean)
hold on;
plot(X_keV(1:55), T_tab_20C_mean)
hold on;
plot(X_keV(1:55), T_tab_10C_mean)
hold on;
plot(X_keV(1:55), T_tab_0C_mean)
hold on;
plot(X_keV(1:55), T_tab_m10C_mean)
hold on;
plot(X_keV(1:55), T_tab_m20C_mean)
hold on;
plot(X_keV(1:55), T_tab_m30C_mean)
hold on;
plot(X_keV(1:55), T_tab_m40C_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_keV_0111.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_keV_0111.pdf','ContentType','vector');


%% errorbar plot TDF CSAVrefGM: fixed @ 530mV [X axis: keV]

f = figure('visible','off');

box
hold on
errorbar(X_keV(1:55), T_tab_30B_mean, T_tab_30A_std)
hold on;
errorbar(X_keV(1:55), T_tab_20B_mean, T_tab_20B_std)
hold on;
errorbar(X_keV(1:55), T_tab_10B_mean, T_tab_10B_std)
hold on;
errorbar(X_keV(1:55), T_tab_0B_mean, T_tab_0B_std)
hold on;
errorbar(X_keV(1:55), T_tab_m10B_mean, T_tab_m10B_std)
hold on;
errorbar(X_keV(1:55), T_tab_m20B_mean, T_tab_m20B_std)
hold on;
errorbar(X_keV(1:55), T_tab_m30B_mean, T_tab_m30B_std)
hold on;
errorbar(X_keV(1:55), T_tab_m40B_mean, T_tab_m40B_std)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/errbar_fdt_csavrefgm_530mV_tau6_keV.fig')
exportgraphics(gcf,'pdf/errbar_fdt_csavrefgm_530mV_tau6_keV.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: fixed @ 530mV [X axis: keV]

f = figure('visible','on');

box
hold on
plot(X_keV(1:55), T_tab_30B_mean)
hold on;
plot(X_keV(1:55), T_tab_20B_mean)
hold on;
plot(X_keV(1:55), T_tab_10B_mean)
hold on;
plot(X_keV(1:55), T_tab_0B_mean)
hold on;
plot(X_keV(1:55), T_tab_m10B_mean)
hold on;
plot(X_keV(1:55), T_tab_m20B_mean)
hold on;
plot(X_keV(1:55), T_tab_m30B_mean)
hold on;
plot(X_keV(1:55), T_tab_m40B_mean)

%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
ylim([0 2000])
yticks([0:200:2000])
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $30^{\circ}$C', 'T = $20^{\circ}$C', 'T = $10^{\circ}$C', 'T = $0^{\circ}$C', 'T = $-10^{\circ}$C', 'T = $-20^{\circ}$C', 'T = $-30^{\circ}$C', 'T = $-40^{\circ}$C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_530mV_tau6_keV.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_530mV_tau6_keV.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: DAC code] [-40??C to -30??C] [HRRR = 0011]

f = figure('visible','off');

hold on
plot(X(1:55), T_tab_m30A_mean)
hold on;
plot(X(1:55), T_tab_m32A_mean)
hold on;
plot(X(1:55), T_tab_m34A_mean)
hold on;
plot(X(1:55), T_tab_m36A_mean)
hold on;
plot(X(1:55), T_tab_m38A_mean)
hold on;
plot(X(1:55), T_tab_m40A_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_DAC_40-30_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_40-30_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: DAC code] [-40??C to -30??C] [HRRR = 0111]

f = figure('visible','off');

hold on
plot(X(1:55), T_tab_m30C_mean)
hold on;
plot(X(1:55), T_tab_m32C_mean)
hold on;
plot(X(1:55), T_tab_m34C_mean)
hold on;
plot(X(1:55), T_tab_m36C_mean)
hold on;
plot(X(1:55), T_tab_m38C_mean)
hold on;
plot(X(1:55), T_tab_m40C_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_auto_tau6_DAC_40-30_0111.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_40-30_0111.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: fixed @ 530mV [X axis: DAC code] [-40??C to -30??C]

f = figure('visible','off');

hold on
plot(X(1:55), T_tab_m30B_mean)
hold on;
plot(X(1:55), T_tab_m32B_mean)
hold on;
plot(X(1:55), T_tab_m34B_mean)
hold on;
plot(X(1:55), T_tab_m36B_mean)
hold on;
plot(X(1:55), T_tab_m38B_mean)
hold on;
plot(X(1:55), T_tab_m40B_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')

savefig('fig/fdt_csavrefgm_530mV_tau6_DAC_40-30.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_530mV_tau6_DAC_40-30.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto & 530mV [X axis: DAC code] [-40??C to 30??C, 10??C/step] [HRRR = 0011]

f = figure('visible','off');

% CSAVrefGM: auto
hold on;
p1A = plot(X(1:55), T_tab_30A_mean, "Color", 'red')
p2A = plot(X(1:55), T_tab_20A_mean, "Color", 'red')
p3A = plot(X(1:55), T_tab_10A_mean, "Color", 'red')
p4A = plot(X(1:55), T_tab_0A_mean, "Color", 'red')
p5A = plot(X(1:55), T_tab_m10A_mean,  "Color", 'red')
p6A = plot(X(1:55), T_tab_m20A_mean, "Color", 'red')
p7A = plot(X(1:55), T_tab_m30A_mean, "Color", 'red')
p8A = plot(X(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: 530mV
p1B = plot(X(1:55), T_tab_30B_mean, "Color", 'blue')
p2B = plot(X(1:55), T_tab_20B_mean, "Color", 'blue')
p3B = plot(X(1:55), T_tab_10B_mean, "Color", 'blue')
p4B = plot(X(1:55), T_tab_0B_mean, "Color", 'blue')
p5B = plot(X(1:55), T_tab_m10B_mean, "Color", 'blue')
p6B = plot(X(1:55), T_tab_m20B_mean, "Color", 'blue')
p7B = plot(X(1:55), T_tab_m30B_mean, "Color", 'blue')
p8B = plot(X(1:55), T_tab_m40B_mean, "Color", 'blue')
hold off

legend([p1A, p1B], 'CSAVrefGM = auto', 'CSAVrefGM = 530mV', 'Location','southeast')

box
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / 30??C range)']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

savefig('fig/fdt_csavrefgm_auto-530mV_tau6_DAC_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto-530mV_tau6_DAC_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto & 530mV [X axis: keV] [-40??C to 30??C, 10??C/step] [HRRR = 0011]

f = figure('visible','off');

% CSAVrefGM: auto
hold on;
p1A = plot(X_keV(1:55), T_tab_30A_mean, "Color", 'red')
p2A = plot(X_keV(1:55), T_tab_20A_mean, "Color", 'red')
p3A = plot(X_keV(1:55), T_tab_10A_mean, "Color", 'red')
p4A = plot(X_keV(1:55), T_tab_0A_mean, "Color", 'red')
p5A = plot(X_keV(1:55), T_tab_m10A_mean,  "Color", 'red')
p6A = plot(X_keV(1:55), T_tab_m20A_mean, "Color", 'red')
p7A = plot(X_keV(1:55), T_tab_m30A_mean, "Color", 'red')
p8A = plot(X_keV(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: 530mV
p1B = plot(X_keV(1:55), T_tab_30B_mean, "Color", 'blue')
p2B = plot(X_keV(1:55), T_tab_20B_mean, "Color", 'blue')
p3B = plot(X_keV(1:55), T_tab_10B_mean, "Color", 'blue')
p4B = plot(X_keV(1:55), T_tab_0B_mean, "Color", 'blue')
p5B = plot(X_keV(1:55), T_tab_m10B_mean, "Color", 'blue')
p6B = plot(X_keV(1:55), T_tab_m20B_mean, "Color", 'blue')
p7B = plot(X_keV(1:55), T_tab_m30B_mean, "Color", 'blue')
p8B = plot(X_keV(1:55), T_tab_m40B_mean, "Color", 'blue')
hold off

legend([p1A, p1B], 'CSAVrefGM = auto [HRRR = $(0011)_{2}$]', 'CSAVrefGM = 530mV', 'Location','southeast')

box
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / 30??C range)']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

savefig('fig/fdt_csavrefgm_auto-530mV_tau6_keV_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto-530mV_tau6_keV_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM HRRR = 0011 & HRRR = 0111 [X axis: DAC code] [-40??C to 30??C, 10??C/step]

f = figure('visible','off');

% CSAVrefGM: auto [HRRR = 0011]
hold on;
p1A = plot(X(1:55), T_tab_30A_mean, "Color", 'red')
p2A = plot(X(1:55), T_tab_20A_mean, "Color", 'red')
p3A = plot(X(1:55), T_tab_10A_mean, "Color", 'red')
p4A = plot(X(1:55), T_tab_0A_mean, "Color", 'red')
p5A = plot(X(1:55), T_tab_m10A_mean,  "Color", 'red')
p6A = plot(X(1:55), T_tab_m20A_mean, "Color", 'red')
p7A = plot(X(1:55), T_tab_m30A_mean, "Color", 'red')
p8A = plot(X(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: auto [HRRR = 0111]
p1B = plot(X(1:55), T_tab_30C_mean, "Color", 'blue')
p2B = plot(X(1:55), T_tab_20C_mean, "Color", 'blue')
p3B = plot(X(1:55), T_tab_10C_mean, "Color", 'blue')
p4B = plot(X(1:55), T_tab_0C_mean, "Color", 'blue')
p5B = plot(X(1:55), T_tab_m10C_mean, "Color", 'blue')
p6B = plot(X(1:55), T_tab_m20C_mean, "Color", 'blue')
p7B = plot(X(1:55), T_tab_m30C_mean, "Color", 'blue')
p8B = plot(X(1:55), T_tab_m40C_mean, "Color", 'blue')
hold off

legend([p1A, p1B], 'CSAVrefGM = auto [HRRR = (0011)_2]', 'CSAVrefGM = auto [HRRR = (0111)_2]', 'Location','southeast')

box
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / 30??C range)']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

savefig('fig/fdt_csavrefgm_auto_0011_0111_tau6_DAC.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_0011_0111_tau6_DAC.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM HRRR = 0011 & HRRR = 0111 [X axis: keV] [-40??C to 30??C, 10??C/step]

f = figure('visible','off');

% CSAVrefGM: auto [HRRR = 0011]
hold on;
p1A = plot(X_keV(1:55), T_tab_30A_mean, "Color", 'red')
p2A = plot(X_keV(1:55), T_tab_20A_mean, "Color", 'red')
p3A = plot(X_keV(1:55), T_tab_10A_mean, "Color", 'red')
p4A = plot(X_keV(1:55), T_tab_0A_mean, "Color", 'red')
p5A = plot(X_keV(1:55), T_tab_m10A_mean,  "Color", 'red')
p6A = plot(X_keV(1:55), T_tab_m20A_mean, "Color", 'red')
p7A = plot(X_keV(1:55), T_tab_m30A_mean, "Color", 'red')
p8A = plot(X_keV(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: auto [HRRR = 0111]
p1B = plot(X_keV(1:55), T_tab_30C_mean, "Color", 'blue')
p2B = plot(X_keV(1:55), T_tab_20C_mean, "Color", 'blue')
p3B = plot(X_keV(1:55), T_tab_10C_mean, "Color", 'blue')
p4B = plot(X_keV(1:55), T_tab_0C_mean, "Color", 'blue')
p5B = plot(X_keV(1:55), T_tab_m10C_mean, "Color", 'blue')
p6B = plot(X_keV(1:55), T_tab_m20C_mean, "Color", 'blue')
p7B = plot(X_keV(1:55), T_tab_m30C_mean, "Color", 'blue')
p8B = plot(X_keV(1:55), T_tab_m40C_mean, "Color", 'blue')
hold off

legend([p1A, p1B], 'CSAVrefGM = auto [HRRR = $(0011)_2$]', 'CSAVrefGM = auto [HRRR = $(0111)_2$]', 'Location','southeast', 'interpreter', 'latex')

box
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / 30??C range)']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

savefig('fig/fdt_csavrefgm_auto_0011_0111_tau6_keV.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_0011_0111_tau6_keV.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto & 530mV [X axis: DAC code] [-40??C to -30??C, 2??C/step] [HRRR = 0011]

f = figure('visible','off');

% CSAVrefGM: auto
hold on;
p1A = plot(X(1:55), T_tab_m30A_mean, "Color", 'red')
p2A = plot(X(1:55), T_tab_m32A_mean, "Color", 'red')
p3A = plot(X(1:55), T_tab_m34A_mean, "Color", 'red')
p4A = plot(X(1:55), T_tab_m36A_mean, "Color", 'red')
p5A = plot(X(1:55), T_tab_m38A_mean,  "Color", 'red')
p6A = plot(X(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: 530mV
p1B = plot(X(1:55), T_tab_m30B_mean, "Color", 'blue')
p2B = plot(X(1:55), T_tab_m32B_mean, "Color", 'blue')
p3B = plot(X(1:55), T_tab_m34B_mean, "Color", 'blue')
p4B = plot(X(1:55), T_tab_m36B_mean, "Color", 'blue')
p5B = plot(X(1:55), T_tab_m38B_mean, "Color", 'blue')
p6B = plot(X(1:55), T_tab_m40B_mean, "Color", 'blue')
hold off

legend([p1A, p1B], 'CSAVrefGM = auto [HRRR = (0011)_2]', 'CSAVrefGM = 530mV', 'Location','southeast')

box
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / -30??C range)']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

savefig('fig/fdt_csavrefgm_auto-530mV_tau6_DAC_40-30_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto-530mV_tau6_DAC_40-30_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM HRRR = 0011 & HRRR = 0111 [X axis: DAC code] [-40??C to -30??C, 2??C/step]

f = figure('visible','off');

% CSAVrefGM: auto [HRRR = 0011]
hold on;
p1A = plot(X(1:55), T_tab_m30A_mean, "Color", 'red')
p2A = plot(X(1:55), T_tab_m32A_mean, "Color", 'red')
p3A = plot(X(1:55), T_tab_m34A_mean, "Color", 'red')
p4A = plot(X(1:55), T_tab_m36A_mean, "Color", 'red')
p5A = plot(X(1:55), T_tab_m38A_mean,  "Color", 'red')
p6A = plot(X(1:55), T_tab_m40A_mean, "Color", 'red')

% CSAVrefGM: auto [HRRR = 0111]
p1B = plot(X(1:55), T_tab_m30C_mean, "Color", 'blue')
p2B = plot(X(1:55), T_tab_m32C_mean, "Color", 'blue')
p3B = plot(X(1:55), T_tab_m34C_mean, "Color", 'blue')
p4B = plot(X(1:55), T_tab_m36C_mean, "Color", 'blue')
p5B = plot(X(1:55), T_tab_m38C_mean, "Color", 'blue')
p6B = plot(X(1:55), T_tab_m40C_mean, "Color", 'blue')
hold off

box
legend([p1A, p1B], 'CSAVrefGM = auto [HRRR = (0011)_2]', 'CSAVrefGM = auto [HRRR = (0111)_2]', 'Location','southeast')
%title(['Transfer Function for \tau_{' num2str(tau) '} (-40??C / -30??C range)']);
xlabel('CAL\_Voltage [DAC\_inj Code]');
ylabel('Channel\_out [ADC code]');
xlim([0, 64000]);
xticklabels([0:10000:60000])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

savefig('fig/fdt_csavrefgm_auto_0011_0111_tau6_DAC_40-30.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_0011_0111_tau6_DAC_40-30.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: keV] [-40??C to -30??C] [HRRR = 0011]

f = figure('visible','off');

plot(X_keV(1:55), T_tab_m30A_mean)
hold on;
plot(X_keV(1:55), T_tab_m32A_mean)
hold on;
plot(X_keV(1:55), T_tab_m34A_mean)
hold on;
plot(X_keV(1:55), T_tab_m36A_mean)
hold on;
plot(X_keV(1:55), T_tab_m38A_mean)
hold on;
plot(X_keV(1:55), T_tab_m40A_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0011)_2]']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')
savefig('fig/fdt_csavrefgm_auto_tau6_keV_40-30_0011.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_40-30_0011.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: auto [X axis: keV] [-40??C to -30??C] [HRRR = 0111]

f = figure('visible','off');

plot(X_keV(1:55), T_tab_m30C_mean)
hold on;
plot(X_keV(1:55), T_tab_m32C_mean)
hold on;
plot(X_keV(1:55), T_tab_m34C_mean)
hold on;
plot(X_keV(1:55), T_tab_m36C_mean)
hold on;
plot(X_keV(1:55), T_tab_m38C_mean)
hold on;
plot(X_keV(1:55), T_tab_m40C_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM auto [HRRR = (0111)_2]']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')
savefig('fig/fdt_csavrefgm_auto_tau6_keV_40-30_0111.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_auto_tau6_DAC_40-30_0111.pdf','ContentType','vector');


%% simple line plot TDF CSAVrefGM: fixed @ 530mV [X axis: keV] [-40??C to -30??C]

f = figure('visible','off');

plot(X_keV(1:55), T_tab_m30B_mean)
hold on;
plot(X_keV(1:55), T_tab_m32B_mean)
hold on;
plot(X_keV(1:55), T_tab_m34B_mean)
hold on;
plot(X_keV(1:55), T_tab_m36B_mean)
hold on;
plot(X_keV(1:55), T_tab_m38B_mean)
hold on;
plot(X_keV(1:55), T_tab_m40B_mean)

box
%title(['Transfer Function for \tau_{' num2str(tau) '}: CSAVrefGM fixed @ 530mV']);
xlabel('Incoming energy [MeV]');
ylabel('Channel\_out [ADC code]');
xlim([0, 53824]);
xticks([0:10000:50000])
xticklabels([0:10:50])
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -30??C', 'T = -32??C', 'T = -34??C', 'T = -36??C', 'T = -38??C', 'T = -40??C', 'Location','southeast')
savefig('fig/fdt_csavrefgm_530mV_tau6_keV_40-30.fig')
exportgraphics(gcf,'pdf/fdt_csavrefgm_530mV_tau6_keV_40-30.pdf','ContentType','vector');
