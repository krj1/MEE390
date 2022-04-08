clear all; close all; clc;

B = readtable('Even Birthday Odd ZID.csv');
A = B{:,:};

%scatter(A(1:end,1),A(1:end,2))
%{
hist(A(1:end,2),12)
xlabel('data value')
ylabel('number of values in each data range')
title('Even Birthday Odd ZID Data Distrabution 12 Divisions', 'FontSize', 14)     

figure;
hist(A(1:end,2),80)
xlabel('data value')
ylabel('number of values in each data range')
title('Even Birthday Odd ZID Data Distrabution 80 Divisions', 'FontSize', 14)


figure;
hist(A(1:end,2),24)
xlabel('data value')
ylabel('number of values in each data range')
title('Even Birthday Odd ZID Data Distrabution 24 Divisions', 'FontSize', 14)
%}

B = readtable('Even Birthday Odd ZID.csv');
A = B{:,:};

mean_val = mean(histcounts(A(1:end,2),100));
cron_a = sort(A);
edges = [];


for i = 1:round(mean_val):length(A)
    edges = [edges, cron_a(i,2)];
end
figure;
histogram(A(1:end,2),edges)
xlabel('data value')
ylabel('number of values in each data range')
title('Even Birthday Odd ZID Data Distrabution 100 Nonuniform Divisions', 'FontSize', 14)



