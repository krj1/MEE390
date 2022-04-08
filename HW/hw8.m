clc; clear all; close all;


%------------ploting for question 2------------%
t = 0:pi/10000:2*pi/5;
y = 8 - 8.09*exp(-6.3*t).*sin(41.53*(t+0.0342));

max(y);
min(y);

I = find(abs(y-8) > .1);

y(188);
figure;
plot(t,y)
xlim([0,1.1])
xlabel('time [s]','FontSize',18);
ylabel('Voltage [mV]','FontSize',18);
title('2nd Order Underdampted Response','FontSize',16)
%------------ploting for question 4------------%
p = [0.025, 15.66;
0.05, 16.29;
0.1, 17.33;
0.2, 18.77;
0.4, 20.18;
0.7, 20.82;
1.1, 20.98;
1.6, 21.0;];

j = p(:,1)';
l = p(:,2)';


figure;
scatter(j,l,'filled')
hold on
%yline((max(l)-min(l))*.63+min(l))   % used to find 'overshoot of the steady-state response'

t = 0:.05:1.6;
y = .50*42+(15.3-.50*42)*exp(-t/0.21);
plot(t,y)
xlabel('time [s]','FontSize',18);
ylabel('Voltage [mV]','FontSize',18);
title('1st Order Response','FontSize',16)
legend('experimental data','reconstructed equation','location', 'SouthEast','FontSize',16)
ylim([15,22])
xlim([0,1.7])


%------------making table for question 5------------&

time = [];
for num = 1:1:10
    time = [time, reallog(num*.1)*-.2];
end

error = flip([.1:.1:1]');
time = flip(time');

T = table(error, time)

