%% DAC threshold voltage analysis [FTHR span @-40°C]

clear; clc;
plots = nan(1, 2);

% linear regression for each curve
disp("LINEAR REGRESSION MODEL: y = a + b * x")

for j = -10:10:30
    DATA = readtable(sprintf('DAC_thr_data/readings_DAC_thr_voltage_%d.txt', j), 'Format','%f %f');
    
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
    plots(1, abs(j/10)+1) = plot(thr_mean(:, 1), thr_mean(:, 2)*1000);
    title('Threshold Voltage vs DAC THR Code')
    xlabel("DAC THR code")
    ylabel("THR Voltage [mV]")
    xlim([0, 255])

    % Fit line to data using polyfit
    c = polyfit(thr_mean(:, 1),thr_mean(:, 2)*1000,1);

    % Display evaluated equation y = p0 + p1*x
    disp(['TEMP = ' num2str(j) ' °C, y = ' num2str(c(2)) ' + ' num2str(c(1)) ' * x'])
end

box
legend('T = -10 °C', 'T = 0 °C', 'T = 10 °C', 'T = 20 °C', 'T = 30 °C')
savefig('fig/DAC_thr_voltage_TEMP.fig')
exportgraphics(gcf,'pdf/DAC_thr_voltage_TEMP.pdf','ContentType','vector');


%% DAC threshold voltage analysis [FTHR span @-40°C]

clear; clc;
plots = nan(1, 2);

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
    title('Threshold Voltage vs DAC THR Code')
    xlabel("DAC THR code")
    ylabel("THR Voltage [mV]")
    xlim([0, 255])

    % Fit line to data using polyfit
    c = polyfit(thr_mean(:, 1),thr_mean(:, 2)*1000,1);

    % Display evaluated equation y = p0 + p1*x
    disp(['FTHR = ' num2str(j) ', y = ' num2str(c(2)) ' + ' num2str(c(1)) '*x'])
end

box
legend(plots, 'FTHR = (000)_2', 'FTHR = (001)_2', 'FTHR = (010)_2', 'FTHR = (011)_2', 'FTHR = (100)_2', 'FTHR = (101)_2', 'FTHR = (110)_2', 'FTHR = (111)_2')
savefig('fig/DAC_thr_voltage_FTHR_-40C.fig')
exportgraphics(gcf,'pdf/DAC_thr_voltage_FTHR_-40C.pdf','ContentType','vector');
