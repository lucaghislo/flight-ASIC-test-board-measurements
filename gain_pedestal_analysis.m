% Importare prima i dati delle FDT eseguendo la prima sezione di
% FDT_plots.m

%% ANALISI GAIN LOW/HIGH ENERGY (HIGH/LOW GAIN REGIONS)

f = figure('visible','on');
clc;

% Create and Plot Raw Data
% HIGH GAIN (low energy, 10-100 keV) -> (1:11)
% LOW GAIN (high energy, 40-55 MeV) -> (47:end)
x = X_keV(47:end);
y = T_tab_30B_mean(47:end); % manually change temperature to get gain
plot(x,y,'LineWidth',2)

% disp gain
disp(mean(diff(y)./diff(x)))
disp(max(diff(y)./diff(x)))
disp(min(diff(y)./diff(x)))


%% PLOT GAIN RESULTS

clear; clc;

fontsize = 12;
f = figure('visible','on');

% Create and Plot Raw Data
%x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30]; % [all steps]

%y = [0.9286 0.99537 1.0465 1.0977 1.1545 1.2305 1.2572 1.2898]; % HIGH GAIN (low energy) [10°C step, auto, 0011]
%y = [0.011201 0.011490 0.011774 0.011989 0.012247 0.012501 0.012473 0.011799]; % LOW GAIN (high energy) [10°C step, auto, 0011]
%y = [0.85593 0.75099 0.63282 0.51795 0.39415 0.29776 0.21870 0.16317]; % HIGH GAIN (low energy) [10°C step, 530mV]
%y = [0.011237 0.011527 0.011846 0.012168 0.012511 0.012850 0.013139 0.013459]; % LOW GAIN (high energy) [10°C step, 530mV]

% CHOOSE PLOT TO SHOW
%y = [0.9923 1.0242 1.0349 1.0419 1.0575 1.0720 1.1298 1.1937 1.2586 1.2995 1.3686 1.4094] % HIGH GAIN (low energy) [all steps, auto, 0011]
%y_high = [1.1060 1.1308 1.1244 1.1397 1.4347 1.3421 1.2256 1.3062 1.4121 1.5175 1.6110 1.5160] - y;
%y_low = [0.7859 0.8618 0.6881 0.8543 0.8179 0.8900 0.9611 1.0264 1.1174 1.0148 1.0356 1.2598] - y;

%y = [0.0113 0.0114 0.0114 0.0114 0.0116 0.0116 0.0118 0.0120 0.0123 0.0125]; % LOW GAIN (high energy) [all steps, auto, 0011]
%y_high = [0.0116 0.0117 0.0117 0.0118 0.0123 0.0121 0.0121 0.0125 0.0130 0.0131] - y;
%y_low = [0.0110 0.0110 0.0110 0.0111 0.0111 0.0111 0.0115 0.0116 0.0117 0.0120] - y;

%y = [] % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = [] % LOW GAIN (high energy) [all steps, auto, 0111]

y = [0.9272 0.9066 0.8834 0.8632 0.8388 0.8160 0.6871 0.5558 0.4192 0.3102 0.2244 0.1695]; % HIGH GAIN (low energy) [all steps, 530mv]
y_high = [0.9991 1.1104 1.1632 1.3786 1.1475 0.9162 0.9185 0.6245 0.4433 0.6427 0.2399 0.1889] - y;
y_low = [0.7946 0.5730 0.7164 0.5836 0.5710 0.6717 0.5804 0.4883 0.3791 0.2600 0.1961 0.1514] - y;

%y = [0.0112 0.0114 0.0115 0.0115 0.0115 0.0116 0.0120 0.0123 0.0126 0.0129 0.0133 0.0136]; % LOW GAIN (high energy) [all steps, 530mv]
%y_high = [0.0116 0.0118 0.0121 0.0118 0.0120 0.0121 0.0126 0.0129 0.0132 0.0135 0.0137 0.0141] - y;
%y_low = [0.0107 0.0107 0.0109 0.0112 0.0111 0.0112 0.0115 0.0118 0.0121 0.0123 0.0129 0.0129] - y;

%plot(x,y, '-o')
errorbar(x, y, y_low, y_high, '-o', 'LineWidth',1)

% Fit line to data using polyfit
c = polyfit(x,y,1);
mdl = fitlm(x,y)

% Display evaluated equation y = p0 + p1*x
disp(['Equation is y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x, R = ' num2str(corrcoef(y))])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',1)

% CHOOSE PLOT TO SHOW
%title({'Gain in X-ray detection region (40-100 keV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Gain in X-ray detection region (40-100 keV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Gain in X-ray detection region (10-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel("Temperature [$^{\circ}$C]")
ylabel('Linear Gain [ADU/keV]'); % change to keV
legend('Mean gain at temperature x', ['y = ' num2str(round(c(2), 2)) ' + ' num2str(round(c(1), 4)) ' $\cdot$ x'], 'Location','northeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_gain_auto_0011";
%filename = "high_energy_gain_auto_0011";
%filename = "low_energy_gain_auto_0111";
%filename = "high_energy_gain_auto_0111";
filename = "low_energy_gain_530mV";
%filename = "high_energy_gain_530mV";

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
savefig(sprintf('fig/%s.fig', filename))
exportgraphics(gcf, sprintf('pdf/%s.pdf', filename),'ContentType','vector');
hold off


%% PLOT NORMALISED ERROR [%/°C]

x = 10:1:170;

% x ray region (HRRR = 0011)
g0 = 1.2586;
po = 183.4157;
g1 = 0.9923;
p1 = 154.3903;

y = nan(160, 1);

for i = 1:161
    y(i) = -(g0/x(i)) * ((p1 + g1 * x(i)) / pow2(g0 + g1 * (-40 - 0)));
    %y(i) = (100/x(i)) * y(i)
end

plot(x, y);
grid on
xlim([0 200])


%% MEAN PEDESTAL LOW/HIGH ENERGY (HIGH/LOW GAIN)

clc;

% manually change temperature to get pedestal
% HIGH GAIN (low energy, 10-100 keV) -> (1:11)
% LOW GAIN (high energy, 40-55 MeV) -> (47:end)

pedestal_data = T_tab_30B_mean(47:end);
mean_ped_low_energy = mean(pedestal_data)
disp(max(pedestal_data))
disp(min(pedestal_data))


%% PLOT PEDESTAL RESULTS

clear; clc;

fontsize = 12;
f = figure('visible','on');

% Create and Plot Raw Data
%x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30]; % [all steps]

% pedestal means
%y = [150.4564 157.9231 164.8835 171.6629 178.3843 186.5613 192.7818 190.9261]; % HIGH GAIN (low energy) [10°C step, auto, 0011] 
%y = [1448.4 1518.7 1589.9 1659.7 1728.9 1796.5 1862.5 1913.3]; % LOW GAIN (high energy) [10°C step, auto, 0011] 
%y = [145.7534 142.4282 137.1384 131.2691 124.3402 119.8640 117.3576 117.1489]; % HIGH GAIN (low energy) [10°C step, 530mV] 
%y = [1404.5 1384.5 1361.7 1341.0 1310.3 1285.1 1262.8 1248.1]; % LOW GAIN (high energy) [10°C step, 530mV] 

% CHOOSE PLOT TO SHOW
%y = [154.3903 157.3448 158.9579 160.2252 161.7474 162.3305 169.5153 176.6666 183.4157 191.2847 197.8273 196.9305]; % HIGH GAIN (low energy) [all steps, auto, 0011]
%y_high = [257.9844 262.9563 266.0441 268.3769 272.4072 272.3756 286.0688 300.0072 312.3553 326.6081 338.0531 342.6831] - y;
%y_low = [106.5131 107.6084 108.7534 109.7194 109.8275 110.0441 114.6816 118.7622 121.9350 126.4157 130.0325 128.6831] - y;

%y = [1460.1 1478.8 1496.1 1508.5 1522.6 1531.4 1602.8 1673.5 1743.0 1813.3 1877.0 1928.8]; % LOW GAIN (high energy) [all steps, auto, 0011]
%y_high = [1535.5 1554.7 1572.2 1584.7 1599.7 1608.6 1681.7 1753.6 1824.6 1896.5 1957.3 1996.1] - y;
%y_low = [1383.4 1401.7 1418.6 1430.8 1443.7 1452.5 1522.3 1591.7 1659.1 1728.1 1790.8 1846.8] - y;

%y = []; % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = []; % LOW GAIN (high energy) [all steps, auto, 0111]

%y = [149.1853 149.5882 148.8412 147.5906 147.0283 144.8068 139.0130 132.4481 125.2133 120.4630 117.731 117.4320]; % HIGH GAIN (low energy) [all steps, 530mV]
%y_high = [244.1125 243.7762 239.4422 235.9462 232.7691 227.4509 208.5116 189.4025 168.7544 153.3984 142.0122 135.7406] - y;
%y_low = [104.3897 106.2613 106.1469 105.2216 106.0297 105.3700 105.4322 105.3769 104.8094 105.3951 106.9038 109.2009] - y;

y = [1416.8 1417.9 1413.2 1409.1 1405.9 1396.8 1373.8 1352.2 1321.8 1296.9 1274.4 1259.1]; % LOW GAIN (high energy) [all steps, 530mV]
y_high = [];
y_low = [];

%plot(x,y, '-o')
errorbar(x, y, y_low, y_high, '-o', 'LineWidth',1)

% Fit line to data using polyfit
c = polyfit(x,y,1);
mdl = fitlm(x,y)

% Display evaluated equation y = p0 + p1*x
disp(['Equation is y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x'])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',1)

% CHOOSE PLOT TO SHOW
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel("Temperature [$^{\circ}$C]")
ylabel('Pedestal [ADU]');
legend('Mean pedestal at temperature x', ['y = ' num2str(round(c(2), 2)) ' + ' num2str(round(c(1), 4)) ' $\cdot$ x'], 'Location','northeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_pedestal_auto_0011";
%filename = "high_energy_pedestal_auto_0011";
%filename = "low_energy_pedestal_auto_0111";
%filename = "high_energy_pedestal_auto_0111";
filename = "low_energy_pedestal_530mV";
%filename = "high_energy_pedestal_530mV";

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
savefig(sprintf('fig/%s.fig', filename))
exportgraphics(gcf, sprintf('pdf/%s.pdf', filename),'ContentType','vector');
hold off