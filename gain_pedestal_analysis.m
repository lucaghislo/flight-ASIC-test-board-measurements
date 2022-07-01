% Importare prima i dati delle FDT eseguendo la prima sezione di
% FDT_plots.m

%% ANALISI GAIN LOW/HIGH ENERGY (HIGH/LOW GAIN REGIONS)

f = figure('visible','on');

% Create and Plot Raw Data
% HIGH GAIN (low energy, 10-100 keV) -> (1:11)
% LOW GAIN (high energy, 40-55 MeV) -> (47:end)
x = X_keV(47:end);
y = T_tab_30B_mean(47:end); % manually change temperature to get gain
plot(x,y,'LineWidth',2)

% disp gain
disp(mean(diff(y)./diff(x)))


%% PLOT GAIN RESULTS

clear; clc;

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
%y = [0.0113 0.0114 0.0114 0.0114 0.0116 0.0116 0.0118 0.0120 0.0123 0.0125]; % LOW GAIN (high energy) [all steps, auto, 0011]
%y = [] % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = [] % LOW GAIN (high energy) [all steps, auto, 0111]
%y = [0.9272 0.9066 0.8834 0.8632 0.8388 0.8160 0.6871 0.5558 0.4192 0.3102 0.2244 0.1695]; % HIGH HAIN (low energy) [all steps, 530mv]
y = [0.0112 0.0114 0.0115 0.0115 0.0115 0.0116 0.0120 0.0123 0.0126 0.0129 0.0133 0.0136]; % LOW GAIN (high energy) [all steps, 530mv]

plot(x,y, '-o')

% Fit line to data using polyfit
c = polyfit(x,y,1);
mdl = fitlm(x,y)

% Display evaluated equation y = p0 + p1*x
disp(['Equation is y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x, R = ' num2str(corrcoef(y))])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',1.5)

% CHOOSE PLOT TO SHOW
%title({'Gain in X-ray detection region (40-100 keV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Gain in X-ray detection region (40-100 keV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Gain in X-ray detection region (10-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel("Temperature [$^{\circ}$C]")
ylabel('Linear Gain [ADU/keV]');
legend('Mean gain at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' $\cdot$ x'], 'Location','southeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_gain_auto_0011";
%filename = "high_energy_gain_auto_0011";
%filename = "low_energy_gain_auto_0111";
%filename = "high_energy_gain_auto_0111";
%filename = "low_energy_gain_530mV";
filename = "high_energy_gain_530mV";

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
mean_ped_low_energy = mean(T_tab_30B_mean(1:11));
mean_ped_high_energy = mean(T_tab_m34B_mean(47:end))


%% PLOT PEDESTAL RESULTS

clear; clc;

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
%y = [1460.1 1478.8 1496.1 1508.5 1522.6 1531.4 1602.8 1673.5 1743.0 1813.3 1877.0 1928.8]; % LOW GAIN (high energy) [all steps, auto, 0011]
%y = []; % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = []; % LOW GAIN (high energy) [all steps, auto, 0111]
y = [149.1853 149.5882 148.8412 147.5906 147.0283 144.8068 139.0130 132.4481 125.2133 120.4630 117.731 117.4320]; % HIGH GAIN (low energy) [all steps, 530mV]
%y = []; % LOW GAIN (high energy) [all steps, 530mV]

plot(x,y, '-o')

% Fit line to data using polyfit
c = polyfit(x,y,1);
mdl = fitlm(x,y)

% Display evaluated equation y = p0 + p1*x
disp(['Equation is y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x'])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',2)

% CHOOSE PLOT TO SHOW
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0111)_2]'});
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: auto [HRRR = (0011)_2]'});
%title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel("Temperature [$^{\circ}$C]")
ylabel('Linear Gain [ADU/keV]');
legend('Mean pedestal at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' $\cdot$ x'], 'Location','northeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_pedestal_auto_0011";
%filename = "high_energy_pedestal_auto_0011";
%filename = "low_energy_pedestal_auto_0111";
%filename = "high_energy_pedestal_auto_0111";
filename = "low_energy_pedestal_530mV";
%filename = "high_energy_pedestal_530mV";

set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
savefig(sprintf('fig/%s.fig', filename))
exportgraphics(gcf, sprintf('pdf/%s.pdf', filename),'ContentType','vector');
hold off