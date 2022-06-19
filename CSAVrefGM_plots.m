%% CSAVREFGM [mV] during testing vs temperature (H = 0, RRR = 011)

clear; clc;
CSAVREFGM_011 = flip([360.5 383.1 405.3 432.1 450.5 473.2 495.1 498.7 503.1 506.8 512.5 517.5]); % measured with H=0 during testing
CSAVREFGM_sim = [527, 503, 479, 455, 431, 407, 384, 361]; % simulated
X_temp = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30];
X_sim = [-40 -30 -20 -10 0 10 20 30];

f = figure('visible','off');

plot(X_temp, CSAVREFGM_011, '-o', X_sim, CSAVREFGM_sim, '-*')
title("CSAVrefGM vs Temperature (H = 0, RRR = 011)");
xlabel('Temperature [°C]');
ylabel('CSAVrefGM [mV]');
legend('CSAVrefGM (measured)', 'CSAVrefGM (simulated)', 'Location','northeast');
savefig('fig/csavrefgm_temperature_0011.fig')
exportgraphics(gcf,'pdf/csavrefgm_temperature_0011.pdf','ContentType','vector');
exportgraphics(gcf,'eps/csavrefgm_temperature_0011.eps','ContentType','vector');


%% CSAVREFGM [mV] during testing vs temperature (H = 0, RRR = 111)

CSAVREFGM_111 = flip([370.9 392.0 413.8 436.3 458.4 480.6 504.3 507.5 512.0 513.4 520.9 525.8]); % measured with H=0 during testing
CSAVREFGM_sim = [527, 503, 479, 455, 431, 407, 384, 361]; % simulated
X_temp = [-40 -38 -36 -34 -32 -30 -20 -10 0 10 20 30];
X_sim = [-40 -30 -20 -10 0 10 20 30];

f = figure('visible','off');

plot(X_temp, CSAVREFGM_111, '-o', X_sim, CSAVREFGM_sim, '-*')
title("CSAVrefGM vs Temperature (H = 0, RRR = 111)");
xlabel('Temperature [°C]');
ylabel('CSAVrefGM [mV]');
legend('CSAVrefGM (measured)', 'CSAVrefGM (simulated)', 'Location','northeast');
savefig('fig/csavrefgm_temperature_0111.fig')
exportgraphics(gcf,'pdf/csavrefgm_temperature_0111.pdf','ContentType','vector');
exportgraphics(gcf,'eps/csavrefgm_temperature_0111.eps','ContentType','vector');


%% CSAVREFGM [HRRR = 0011] vs CSAVREFGM [HRRR = 0111] vs simulation

f = figure('visible','off');

plot(X_temp, CSAVREFGM_011, '-o', X_temp, CSAVREFGM_111, '-o', X_sim, CSAVREFGM_sim, '-*')
title("CSAVrefGM");
xlabel('Temperature [°C]');
ylabel('CSAVrefGM [mV]');
legend('HRRR = (0011)_2', 'HRRR = (0111)_2', 'Simulated HRRR = (0011)_2', 'Location','northeast');
savefig('fig/csavrefgm_RRR_011_111.fig')
exportgraphics(gcf,'pdf/csavrefgm_RRR_011_111.pdf','ContentType','vector')
exportgraphics(gcf,'eps/csavrefgm_RRR_011_111.eps','ContentType','vector')


%% CSAVREFGM [mV] during testing vs RRR bits configuration @ -40°C (H=0)

clear; clc;
CSAVREFGM_H0 = [510.1 512.3 515.1 517.4 519.8 521.8 524.0 525.9]; % measured at -40°C with H=0
X = [1:1:8];

f = figure('visible','off');

plot(X, CSAVREFGM_H0, '-o')
title("CSAVrefGM vs RRR bits configuration @ -40°C (bit H = 0)");
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
xlabel('RRR bits');
ylabel('CSAVrefGM [mV]');
savefig('fig/csavrefgm_RRR_-40C_H0.fig')
exportgraphics(gcf,'pdf/csavrefgm_RRR_-40C_H0.pdf','ContentType','vector');
exportgraphics(gcf,'eps/csavrefgm_RRR_-40C_H0.eps','ContentType','vector');


%% CSAVREFGM [mV] during testing vs RRR bits configuration @ -40°C (H=1)

CSAVREFGM_H1 = [540.3 541.6 543.3 544.5 545.8 547.1 548.7 549.9]; % measured at -40°C with H=1

f = figure('visible','off');

plot(X, CSAVREFGM_H1, '-o')
title("CSAVrefGM vs RRR bits configuration @ -40°C (bit H = 0)");
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
xlabel('RRR bits');
ylabel('CSAVrefGM [mV]');
savefig('fig/csavrefgm_RRR_-40C_H1.fig')
exportgraphics(gcf,'pdf/csavrefgm_RRR_-40C_H1.pdf','ContentType','vector');
exportgraphics(gcf,'eps/csavrefgm_RRR_-40C_H1.eps','ContentType','vector');


%% CSAVREFGM [mV] vs RRR bits @ -40°C (H=0 vs H=1)

f = figure('visible','off');

plot(X, CSAVREFGM_H0, '-o', X, CSAVREFGM_H1, '-o')
title("CSAVrefGM vs RRR bits configuration @ -40°C");
xticklabels({'000', '001', '010', '011', '100', '101', '110', '111'})
xlabel('RRR bits');
ylabel('CSAVrefGM [mV]');
legend('H = 0', 'H = 1','Location','southeast')
savefig('fig/csavrefgm_RRR_-40C_H0H1.fig')
exportgraphics(gcf,'pdf/csavrefgm_RRR_-40C_H0H1.pdf','ContentType','vector');
exportgraphics(gcf,'eps/csavrefgm_RRR_-40C_H0H1.eps','ContentType','vector');