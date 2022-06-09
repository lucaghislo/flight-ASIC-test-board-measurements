%% IAVDD [mA] vs Temperature (CSAVREFGM: auto)

clear, clc;
f = figure('visible','off');

IAVDD_auto = flip([149.6 151.6 153.4 155.0 157.1 158.5 159.8 161.1]);
X_temp = [-40 -30 -20 -10 0 10 20 30]

plot(X_temp, IAVDD_auto, '-o')
title("IAVDD vs Temperature (CSAVrefGM: auto)");
xlabel('Temperaure [°C]');
ylabel('IAVDD [mA]');
savefig('fig/IAVDD_temp_CSAVREFGM_auto.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_auto.pdf','ContentType','vector');


%% IAVDD [mA] vs Temperature (CSAVREFGM: 530mV)

f = figure('visible','off');

IAVDD_530mV = flip([150.7 152.3 153.8 155.3 156.7 158.0 159.3 160.6]);

plot(X_temp, IAVDD_530mV, '-o')
title("IAVDD vs Temperature (CSAVrefGM: 530mV)");
xlabel('Temperaure [°C]');
ylabel('IAVDD [mA]');
savefig('fig/IAVDD_temp_CSAVREFGM_530mV.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_530mV.pdf','ContentType','vector');


%% IAVDD [mA] vs Temperature (CSAVREFGM: auto vs 530mV)

f = figure('visible','off');

plot(X_temp, IAVDD_auto, '-o', X_temp, IAVDD_530mV, '-o')
title("IAVDD vs Temperature");
xlabel('Temperaure [°C]');
ylabel('IAVDD [mA]');
legend('CSAVrefGM = auto', 'CSAVrefGM = 530mV','Location','northeast')
savefig('fig/IAVDD_temp_CSAVREFGM_auto-572mV.fig')
exportgraphics(gcf,'pdf/IAVDD_temp_CSAVREFGM_auto-530mV.pdf','ContentType','vector');
