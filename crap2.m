clc; close all; clear all;
%-------For compairing alternitives through future worth--------


percent = 6    /100;
cost_1 = 135000;
cost_2 = 0;

lcm_1 = 1;
lcm_2 = 1;

total_1 = 0;
total_2 = 0;

anuity1 = 10500;
salvage1 = 0;
anuity2 = 4000;
salvage2 = 0;

for i = 1:1:lcm_1
    total_1 = total_1 - cost_1;
    total_1 = total_1 - anuity1;
    total_1 = total_1 + (total_1 * percent);
    
    for a = 1:1:14
        total_1 = total_1 - anuity1;
        total_1 = total_1 + (total_1 * percent);
    end
    total_1 = total_1 + salvage1;
end


for i = 1:1:lcm_2
    total_2 = total_2 - cost_2;
    total_2 = total_2 + (total_2 * percent);
    
    for a = 1:1:4
        total_2 = total_2 + anuity2;
        total_2 = total_2 + (total_2 * percent);
    end
    total_2 = total_2 + salvage2;
end


total_1
total_2

