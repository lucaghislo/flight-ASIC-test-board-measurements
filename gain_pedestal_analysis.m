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

% Fit line to data using polyfit
c = polyfit(x,y,1);

% Display evaluated equation y = m*x + b
% c(1): coefficiente angolare
% c(2): intercetta
disp(['Equation is y = ' num2str(c(1)) '*x + ' num2str(c(2))])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',2)
hold off


%% PLOT GAIN RESULTS

clear; clc;

f = figure('visible','on');

% Create and Plot Raw Data
%x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30] % [all steps]

%y = [0.9286 0.99537 1.0465 1.0977 1.1545 1.2305 1.2572 1.2898]; % HIGH GAIN (low energy) [10°C step, auto, 0011]
%y = [0.011201 0.011490 0.011774 0.011989 0.012247 0.012501 0.012473 0.011799]; % LOW GAIN (high energy) [10°C step, auto, 0011]
%y = [0.85593 0.75099 0.63282 0.51795 0.39415 0.29776 0.21870 0.16317]; % HIGH GAIN (low energy) [10°C step, 530mV]
%y = [0.011237 0.011527 0.011846 0.012168 0.012511 0.012850 0.013139 0.013459]; % LOW GAIN (high energy) [10°C step, 530mV]

% CHOOSE PLOT TO SHOW
%y = [0.87769 0.89379 0.90745 0.91659 0.91969 0.93293 0.98319 1.0447 1.0907 1.1466 1.1954 1.2323] % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = [0.01121 0.011302 0.011356 0.011395 0.011451 0.011526 0.011805 0.012039 0.012265 0.012552 0.012746 0.012512]; % LOW GAIN (high energy) [all steps, auto, 0111]
%y = [0.9286 0.9477 0.9623 0.96948 0.98281 0.99537 1.0465 1.0977 1.1545 1.2153 1.2572 1.2898] % HIGH GAIN (low energy) [all steps, auto, 0011]
%y = [0.011201 0.011272 0.011345 0.011421 0.011454 0.011490 0.01174 0.011989 0.012247 0.012492 0.012473 0.011799] % LOW GAIN (high energy) [all steps, auto, 0011]
%y = [0.85593 0.84394 0.82741 0.79938 0.78246 0.75099 0.63282 0.51795 0.39415 0.29776 0.21870 0.16317]; % HIGH HAIN (low energy) [all steps, 530mv]
y = [0.011237 0.011315 0.011399 0.011426 0.011480 0.011527 0.011846 0.012168 0.012511 0.012850 0.013139 0.013459]; % LOW GAIN (high energy) [all steps, 530mv]

plot(x,y, '-o')

% Fit line to data using polyfit
c = polyfit(x,y,1);

% Display evaluated equation y = p0 + p1*x
disp(['Equation is y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x'])

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
title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel('Temperature [°C]');
ylabel('Linear Gain [ADU/keV]');
legend('Mean gain at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x'], 'Location','southeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_gain_auto_0011";
%filename = "high_energy_gain_auto_0011";
%filename = "low_energy_gain_auto_0111";
%filename = "high_energy_gain_auto_0111";
%filename = "low_energy_gain_530mV";
filename = "high_energy_gain_530mV";

savefig(sprintf('fig/%s.fig', filename))
exportgraphics(gcf, sprintf('pdf/%s.pdf', filename),'ContentType','vector');
exportgraphics(gcf, sprintf('eps/%s.eps', filename),'ContentType','vector');
hold off


%% MEAN PEDESTAL LOW/HIGH ENERGY (HIGH/LOW GAIN)

clc;
% manually change temperature to get pedestal
mean_ped_low_energy = mean(T_tab_30B_mean(1:11));
mean_ped_high_energy = mean(T_tab_30B_mean(47:end))


%% PLOT PEDESTAL RESULTS

clear; clc;

f = figure('visible','on');

% Create and Plot Raw Data
%x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30] % [all steps]

% pedestal means
%y = [150.4564 157.9231 164.8835 171.6629 178.3843 186.5613 192.7818 190.9261]; % HIGH GAIN (low energy) [10°C step, auto, 0011] 
%y = [1448.4 1518.7 1589.9 1659.7 1728.9 1796.5 1862.5 1913.3]; % LOW GAIN (high energy) [10°C step, auto, 0011] 
%y = [145.7534 142.4282 137.1384 131.2691 124.3402 119.8640 117.3576 117.1489]; % HIGH GAIN (low energy) [10°C step, 530mV] 
%y = [1404.5 1384.5 1361.7 1341.0 1310.3 1285.1 1262.8 1248.1]; % LOW GAIN (high energy) [10°C step, 530mV] 

% CHOOSE PLOT TO SHOW
%y = [147.8092 149.1418 151.5099 151.9342 152.846 154.8000 162.0905 168.7897 175.8611 181.6455 188.5995 194.1047]; % HIGH GAIN (low energy) [all steps, auto, 0111]
%y = [1418.2 1433.0 1452.7 1459.0 1467.6 1486.2 1556.0 1625.0 1692.7 1760.3 1826.1 1881.9]; % LOW GAIN (high energy) [all steps, auto, 0111]
%y = [150.4564 153.0806 154.6233 155.9029 157.5707 157.9231 164.8835 171.6629 178.3843 185.6536 192.7818 190.9261]; % HIGH GAIN (low energy) [all steps, auto, 0011]
%y = [1448.4 1466.3 1483.2 1495.5 1509.7 1518.7 1589.9 1659.7 1728.9 1798.2 1862.5 1913.3]; % LOW GAIN (high energy) [all steps, auto, 0011]
%y = [145.7534 146.4100 145.6180 145.3372 144.1384 142.4282 137.1384 131.2691 124.3402 119.8640 117.3576 117.1489]; % HIGH GAIN (low energy) [all steps, 530mV]
y = [1404.5 1406.1 1401.3 1397.4 1398.3 1384.5 1361.7 1341.0 1310.3 1285.1 1262.8 1248.1]; % LOW GAIN (high energy) [all steps, 530mV]

plot(x,y, '-o')

% Fit line to data using polyfit
c = polyfit(x,y,1);

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
title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel('Temperature [°C]');
ylabel('Linear Gain [ADU/keV]');
legend('Mean pedestal at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x'], 'Location','northeast')

% CHOOSE PLOT TO SHOW
%filename = "low_energy_pedestal_auto_0011";
%filename = "high_energy_pedestal_auto_0011";
%filename = "low_energy_pedestal_auto_0111";
%filename = "high_energy_pedestal_auto_0111";
%filename = "low_energy_pedestal_530mV";
filename = "high_energy_pedestal_530mV";

savefig(sprintf('fig/%s.fig', filename))
exportgraphics(gcf, sprintf('pdf/%s.pdf', filename),'ContentType','vector');
exportgraphics(gcf, sprintf('eps/%s.eps', filename),'ContentType','vector');
hold off