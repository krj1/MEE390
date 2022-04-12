%%MEE 390 Lab 4 Task 1 - Hand Waving
clear all; close all; clc;

B = readtable('lab4_data.csv');
A = B{:,:};


%scatter(A(1:end,2),A(1:end,1))


add_data = [A(1,1:end)];
% ------------------ this adds points needed to make the new dataset ----------------
for i = 1:2:height(A)-2
    bag = [A(i,1),A(i+1,2:end)];
    add_data = [add_data; bag; A(i+1,1:end)];
    bag2 = [A(i+1,1),A(i+2,2:end)];
    add_data = [add_data; bag2; A(i+2,1:end)];
end
add_data = [add_data(1:end,1:end); add_data(end,1:end)+[0,.1,.1,.1,.1]]
%------------------------------------------------------------------------------------



%-------------- this makes the data increment with constant time steps---------------
t = linspace(0,10,8192);
t = t'


for i = 1:4:height(add_data) % mich
    store = find(t(1:end,1)>=add_data(i,2) & t(1:end,1)<add_data(i+1,2));
    t(store,2) = 1;
end

for i = 1:4:height(add_data) % kurt
    store = find(t(1:end,1)>=add_data(i,3) & t(1:end,1)<add_data(i+1,3));
    t(store,3) = 1;
end

for i = 1:4:height(add_data) % george
    store = find(t(1:end,1)>=add_data(i,4) & t(1:end,1)<add_data(i+1,4));
    t(store,4) = 1;
end

for i = 1:4:height(add_data) % joe
    store = find(t(1:end,1)>=add_data(i,5) & t(1:end,1)<add_data(i+1,5));
    t(store,5) = 1;
end
   

plot(t(1:end,1),t(1:end,2))
xlabel('time [s]', 'FontSize', 14)
ylabel('value [binary]', 'FontSize', 14)
title('Mich Hand Waving Data', 'FontSize', 14)     

%-----------------------------------------------------------------------------------

% for all future math use t where t(colum 1) = time and t(colum 2) = person value
% colum 1,2,3,4 = mich, kurt, george, joe; respectfully










