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
x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
%x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30] % [all steps]

%y = [0.9286 0.99537 1.0465 1.0977 1.1545 1.2305 1.2572 1.2898]; % HIGH GAIN (low energy) [10°C step, auto]
%y = [0.011201 0.011490 0.011774 0.011989 0.012247 0.012501 0.012473 0.011799]; % LOW GAIN (high energy) [10°C step, auto]
y = [0.85593 0.75099 0.63282 0.51795 0.39415 0.29776 0.21870 0.16317]; % HIGH GAIN (low energy) [10°C step, 530mV]
%y = [0.011237 0.011527 0.011846 0.012168 0.012511 0.012850 0.013139 0.013459]; % LOW GAIN (high energy) [10°C step, 530mV]

%y = [0.93094, 0.94494, 0.95531, 0.96182, 0.95111, 0.98851]; % HIGH GAIN (low energy) [2°C step]
%y = [0.93094, 0.94494, 0.95531, 0.96182, 0.95111, 0.98851 1.0401 1.1051 1.1646 1.2305 1.2873 1.3357]; % HIGH GAIN (low energy) [all steps]

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

title({'Gain in X-ray detection region (40-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Gain in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel('Temperature [°C]');
ylabel('Linear Gain [ADU/keV]');
legend('Mean gain at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x'], 'Location','northeast')
savefig('fig/low_energy_gain_530mV.fig')
exportgraphics(gcf, 'pdf/low_energy_gain_530mV.pdf','ContentType','vector');
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
x = [-40, -30, -20, -10, 0, 10, 20, 30]; % [10°C step]
%x = [-40 -38 -36 -34 -32 -30]; % [2°C step]
%x = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30] % [all steps]

% pedestal means
%y = [150.4564 157.9231 164.8835 171.6629 178.3843 186.5613 192.7818 190.9261]; % HIGH GAIN (low energy) [10°C step, auto] 
%y = [1448.4 1518.7 1589.9 1659.7 1728.9 1796.5 1862.5 1913.3]; % LOW GAIN (high energy) [10°C step, auto] 
y = [145.7534 142.4282 137.1384 131.2691 124.3402 119.8640 117.3576 117.1489]; % HIGH GAIN (low energy) [10°C step, 530mV] 
%y = [1404.5 1384.5 1361.7 1341.0 1310.3 1285.1 1262.8 1248.1]; % LOW GAIN (high energy) [10°C step, 530mV] 

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

title({'Pedestal in X-ray detection region (10-100 keV)', 'CSAVrefGM: 530mV'});
%title({'Pedestal in Muon detection region (40-55 MeV)', 'CSAVrefGM: 530mV'});

xlabel('Temperature [°C]');
ylabel('Linear Gain [ADU/keV]');
legend('Mean pedestal at temperature x', ['y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x'], 'Location','northeast')
savefig('fig/low_energy_pedestal_530mV.fig')
exportgraphics(gcf, 'pdf/low_energy_pedestal_530mV.pdf','ContentType','vector');
hold off