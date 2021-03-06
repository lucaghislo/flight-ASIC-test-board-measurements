%% DAC threshold voltage analysis [FTHR = 011, 10°C/step]

f = figure('visible','on');

clear; clc;
fontsize = 12;
plots = nan(1, 2);
global_count = 1;
DNL = nan(255, 8);
INL = nan(255, 8);
LSB_step = 1.2;

% linear regression for each curve
disp("LINEAR REGRESSION MODEL: y = a + b * x")

for j = -40:10:30
    if(j == -40)
        DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_%d_3.txt', j), 'Format','%f %f');
    else
        DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_%d.txt', j), 'Format','%f %f');
    end
    
    % set desired precision in terms of the number of decimal places
    n_decimal = 5;

    % create a new table
    new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), DATA);

    % preserve the variable names and the row names in the original table
    new_T.Properties.VariableNames = DATA.Properties.VariableNames;
    new_T.Properties.RowNames = DATA.Properties.RowNames;
    
    DATA_array = table2array(DATA);
    DATA_array = round(DATA_array, 5);
    DAC = [1:255]';
    dac_count = 1;
    counter = 0;    
    
    thr_mean = nan(255, 2);
    sum = 0;
    
    % calculate mean per THR DAC value
    for i = 1:length(DATA_array)
        if(DATA_array(i, 1) == DAC(dac_count))
            if(counter>1)
                sum = sum + DATA_array(i, 2);
            end
            counter = counter + 1;
        else
            thr_mean(DAC(dac_count), 1) = DAC(dac_count);
            thr_mean(DAC(dac_count), 2) = sum/(counter-2);
            sum = 0;
            counter = 1;
            dac_count = dac_count + 1;
        end
    end

    % DAC THR = 255
    sum = 0;
    for i = length(DATA_array)-2:length(DATA_array)
        sum = sum + DATA_array(i, 2);
    end

    thr_mean(DAC(255), 1) = DAC(255);
    thr_mean(DAC(255), 2) = sum/3;

    % step analysis
    delta = max(thr_mean(:, 2)) + abs(min(thr_mean(:, 2)));
    disp(max(thr_mean(:, 2))*1000)
    disp((delta/255)*1000)

    hold on
    plots(1, abs(j/10)+1) = plot(thr_mean(:, 1), thr_mean(:, 2)*1000);
    %title('Threshold Voltage vs DAC THR Code')
    xlabel("DAC THR code")
    ylabel("THR Voltage [mV]")
    xlim([0, 255])

    % Fit line to data using polyfit
    c = polyfit(thr_mean(:, 1), thr_mean(:, 2)*1000, 1);

    x = thr_mean(:, 1);
    y = thr_mean(:, 2)*1000;
    f1 = fitlm(x,y)
    y_predict = f1.predict(x);
    Rsquared = f1.Rsquared.Ordinary;

    % Display evaluated equation y = p0 + p1*x
    disp(['TEMP = ' num2str(j) ' °C, y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x, R2 = ' num2str(Rsquared)])

    % INL/DNL analysis
    %s = inldnl(thr_mean(:, 2),thr_mean(:, 1),[-1 1],'DAC','GenPlotData','on','INLMethod','All','DNLMethod','All')
   
    sum = 0;
    for i = 1:length(thr_mean)-1
        y = polyval(c, thr_mean(i, 1));
        %fprintf("%f - %f, difference: %f\n", thr_mean(i, 2)*1000, y, (thr_mean(i, 2)*1000-y));
        
        DNL(i, global_count) =  (((thr_mean(i+1, 2)*1000) - (thr_mean(i, 2)*1000))/LSB_step) - 1;
        %INL(i, global_count) = nansum(DNL(:, global_count)); %#ok<NANSUM>
        INL(i, global_count) = (y - thr_mean(i, 2));
    end
    
    global_count = global_count + 1;
end

box
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = $-40^{ \circ}$C', 'T = $-30^{ \circ}$C', 'T = $-20^{ \circ}$C', 'T = $-10^{ \circ}$C', 'T = $0^{ \circ}$C', 'T = $10^{ \circ}$C', 'T = $20^{ \circ}$C', 'T = $30^{ \circ}$C')
savefig('fig/DAC_thr_voltage_TEMP.fig')
exportgraphics(gcf,'pdf/DAC_thr_voltage_TEMP.pdf','ContentType','vector');


%% DNL plot

f = figure('visible','on');

hold on
for i=1:8
    plot(thr_mean(:, 1), DNL(:, i))
end

%plot([0:255], zeros(1, 256), 'LineStyle','-.', 'LineWidth', 0.8, 'Color', 'red')
%text(235, 0.6, '0 mV', 'Color', 'red')
hold off

box
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
xlim([0 255])
ylabel("Differential Non-Linearity (DNL) [LSB]")
xlabel('DAC THR code')
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -40 °C', 'T = -30 °C', 'T = -20 °C', 'T = -10 °C', 'T = 0 °C', 'T = 10 °C', 'T = 20 °C', 'T = 30 °C', 'Location', 'southeast', 'NumColumns', 2)
savefig('fig/DAC_DNL.fig')
exportgraphics(gcf,'pdf/DAC_DNL.pdf','ContentType','vector');


%% INL plot

f = figure('visible','on');

hold on
for i=1:8
    plot(thr_mean(:, 1), INL(:, i))
end
hold off

box
set(gcf, 'Color', 'w');
set(gca,'fontname','Computer Modern') 
xlim([0 255])
ylabel("Integral Non-Linearity (INL) [LSB]")
xlabel('DAC THR code')
grid on

ax = gca; 
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize;

legend('T = -40 °C', 'T = -30 °C', 'T = -20 °C', 'T = -10 °C', 'T = 0 °C', 'T = 10 °C', 'T = 20 °C', 'T = 30 °C', 'Location', 'northeast', 'NumColumns', 2)
savefig('fig/DAC_INL.fig')
exportgraphics(gcf,'pdf/DAC_INL.pdf','ContentType','vector');


%% DAC threshold voltage analysis [FTHR = 011, 2°C/step]

clear; clc;
fontsize = 12;
plots = nan(1, 2)
count = 0;

f = figure('visible','on');

% linear regression for each curve
disp("LINEAR REGRESSION MODEL: y = a + b * x")

for j = -40:2:-30
    count = count + 1;
    if(j == -40)
        DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_%d_3.txt', j), 'Format','%f %f');
    else
        DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_%d.txt', j), 'Format','%f %f');
    end
    
    % set desired precision in terms of the number of decimal places
    n_decimal = 5;
    % create a new table
    new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), DATA);
    % preserve the variable names and the row names in the original table
    new_T.Properties.VariableNames = DATA.Properties.VariableNames;
    new_T.Properties.RowNames = DATA.Properties.RowNames;
    
    DATA_array = table2array(DATA);
    DATA_array = round(DATA_array, 5);
    DAC = [1:255]';
    dac_count = 1;
    counter = 0;    
    
    thr_mean = nan(255, 2);
    sum = 0;
    
    % calculate mean per THR DAC value
    for i = 1:length(DATA_array)
        if(DATA_array(i, 1) == DAC(dac_count))
            if(counter>1)
                sum = sum + DATA_array(i, 2);
            end
            counter = counter + 1;
        else
            thr_mean(DAC(dac_count), 1) = DAC(dac_count);
            thr_mean(DAC(dac_count), 2) = sum/(counter-2);
            sum = 0;
            counter = 1;
            dac_count = dac_count + 1;
        end
    end

    % DAC THR = 255
    sum = 0;
    for i = length(DATA_array)-2:length(DATA_array)
        sum = sum + DATA_array(i, 2);
    end

    thr_mean(DAC(255), 1) = DAC(255);
    thr_mean(DAC(255), 2) = sum/3;

    hold on
    plots(1, count) = plot(thr_mean(:, 1), thr_mean(:, 2)*1000);
    %title('Threshold Voltage vs DAC THR Code')
    xlabel("DAC THR code")
    ylabel("THR Voltage [mV]")
    xlim([0, 255])
    set(gcf, 'Color', 'w');
    set(gca,'fontname','Computer Modern') 
    grid on

    ax = gca; 
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize;

    % Fit line to data using polyfit
    c = polyfit(thr_mean(:, 1),thr_mean(:, 2)*1000,1);

    x = thr_mean(:, 1);
    y = thr_mean(:, 2)*1000;
    f1 = fitlm(x,y)
    y_predict = f1.predict(x);
    Rsquared = f1.Rsquared.Ordinary;

    % Display evaluated equation y = p0 + p1*x
    disp(['TEMP = ' num2str(j) ' °C, y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x, R2 = ' num2str(Rsquared)])
end

box
legend('T =$-40^{\circ}$C', 'T = $-38^{\circ}$C', 'T = $-36^{\circ}$C', 'T = $-34^{\circ}$C', 'T = $-32^{\circ}$C', 'T = $-30^{\circ}$C', 'Location', 'northeast')
savefig('fig/DAC_thr_voltage_40-30.fig')
exportgraphics(gcf,'pdf/DAC_thr_voltage_40-30.pdf','ContentType','vector');


%% DAC threshold voltage analysis [FTHR span @ -40°C]

clear; clc;
fontsize = 12;
plots = nan(1, 2);

f = figure('visible','on');

% linear regression for each curve
disp("LINEAR REGRESSION MODEL: y = a + b * x")

for j = 0:7
    DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_-40_%d.txt', j), 'Format','%f %f');
    
    % set desired precision in terms of the number of decimal places
    n_decimal = 5;
    % create a new table
    new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), DATA);
    % preserve the variable names and the row names in the original table
    new_T.Properties.VariableNames = DATA.Properties.VariableNames;
    new_T.Properties.RowNames = DATA.Properties.RowNames;
    
    DATA_array = table2array(DATA);
    DATA_array = round(DATA_array, 5);
    DAC = [1:255]';
    dac_count = 1;
    counter = 0;    
    
    thr_mean = nan(255, 2);
    sum = 0;
    
    % calculate mean per THR DAC value
    for i = 1:length(DATA_array)
        if(DATA_array(i, 1) == DAC(dac_count))
            if(counter>1)
                sum = sum + DATA_array(i, 2);
            end
            counter = counter + 1;
        else
            thr_mean(DAC(dac_count), 1) = DAC(dac_count);
            thr_mean(DAC(dac_count), 2) = sum/(counter-2);
            sum = 0;
            counter = 1;
            dac_count = dac_count + 1;
        end
    end

    % DAC THR = 255
    sum = 0;
    for i = length(DATA_array)-2:length(DATA_array)
        sum = sum + DATA_array(i, 2);
    end

    thr_mean(DAC(255), 1) = DAC(255);
    thr_mean(DAC(255), 2) = sum/3;
    
    hold on
    plots(1, j+1) = plot(thr_mean(:, 1), thr_mean(:, 2)*1000);
    %title('Threshold Voltage vs DAC THR Code at -40 °C')
    xlabel("DAC THR code")
    ylabel("THR Voltage [mV]")
    xlim([0, 255])
    set(gcf, 'Color', 'w');
    set(gca,'fontname','Computer Modern') 
    grid on

    ax = gca; 
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize;

    % Fit line to data using polyfit
    c = polyfit(thr_mean(:, 1),thr_mean(:, 2)*1000,1);

    x = thr_mean(:, 1);
    y = thr_mean(:, 2)*1000;
    f1 = fitlm(x,y)
    y_predict = f1.predict(x);
    Rsquared = f1.Rsquared.Ordinary;

    % Display evaluated equation y = p0 + p1*x
    disp(['FTHR = ' num2str(j) ', y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x, R2 = ' num2str(Rsquared)])
end

box
legend(plots, 'FTHR = $(000)_2$', 'FTHR = $(001)_2$', 'FTHR = $(010)_2$', 'FTHR = $(011)_2$', 'FTHR = $(100)_2$', 'FTHR = $(101)_2$', 'FTHR = $(110)_2$', 'FTHR = $(111)_2$')
savefig('fig/DAC_thr_voltage_FTHR_-40C.fig')
exportgraphics(gcf,'pdf/DAC_thr_voltage_FTHR_-40C.pdf','ContentType','vector');
