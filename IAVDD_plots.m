%% IAVDD [mA] vs Temperature (CSAVREFGM: auto) (HRRR = 0011)

clear, clc;
f = figure('visible','off');

IAVDD_auto_0011 = flip([149.6 151.6 153.4 155.0 157.1 158.5 159.8 160.0 160.2 160.3 160.7 161.1]);
X_temp = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30]

plot(X_temp, IAVDD_auto_0011, '-o')
%title("IAVDD vs Temperature [CSAVrefGM: auto, HRRR = (0011)_2]");
xlabel('Temperature [$^{\circ}$C]');
ylabel('IAVDD [mA]');
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

savefig('fig/IAVDD_temp_CSAVREFGM_auto_HRRR_0011.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_auto_HRRR_0011.pdf','ContentType','vector');


%% IAVDD [mA] vs Temperature (CSAVREFGM: auto) (HRRR = 0111)

f = figure('visible','off');

IAVDD_auto_0111 = flip([150.1 152.5 153.7 156.0 157.5 158.7 159.9 160.0 160.2 160.3 160.7 161.1]);
X_temp = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30]

plot(X_temp, IAVDD_auto_0111, '-o')
%title("IAVDD vs Temperature [CSAVrefGM: auto, HRRR = (0111)_2]");
xlabel('Temperature [$^{\circ}$C]');
ylabel('IAVDD [mA]');
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

savefig('fig/IAVDD_temp_CSAVREFGM_auto_HRRR_0111.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_auto_HRRR_0111.pdf','ContentType','vector');


%% IAVDD [mA] vs Temperature (CSAVREFGM: 530mV)

f = figure('visible','off');

IAVDD_530mV = flip([150.7 152.3 153.8 155.3 156.7 158.0 159.3 160.0 160.3 160.5 160.2 160.6]);

plot(X_temp, IAVDD_530mV, '-o')
%title("IAVDD vs Temperature (CSAVrefGM: 530mV)");
xlabel('Temperature [$^{\circ}$C]');
ylabel('IAVDD [mA]');
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

savefig('fig/IAVDD_temp_CSAVREFGM_530mV.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_530mV.pdf','ContentType','vector');


%% IAVDD [mA] vs Temperature (CSAVREFGM: auto [HRRR = 0011, HRRR = 0111] vs 530mV)

f = figure('visible','off');

plot(X_temp, IAVDD_auto_0011, '-o', X_temp, IAVDD_auto_0111, '-o', X_temp, IAVDD_530mV, '-o')
%title("IAVDD vs Temperature");
xlabel('Temperature [$^{\circ}$C]');
ylabel('IAVDD [mA]');
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on
legend('CSAVrefGM = auto [HRRR = $(0011)_{2}$]', 'CSAVrefGM = auto [HRRR = $(0111)_{2}$]', 'CSAVrefGM = 530mV','Location','northeast')

savefig('fig/IAVDD_temp_CSAVREFGM_auto-530mV.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_auto-530mV.pdf','ContentType','vector');
