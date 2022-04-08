clc; close all; clear all;
height = 45; %cm
width = 50; %cm
AcTunnel = width * height;
k = 100;

objectAc = 49; %cm^2

    
    
    
wake = objectAc: -objectAc*.039/k:0;


AcVar = zeros(1,length(wake)) + AcTunnel - wake;


x = linspace(0,length(wake)/k,length(wake));

c = 10 * AcTunnel + zeros(1,length(wake));
y = c ./ AcVar;

plot(x,y)
xlabel('diameters of the solid body','FontSize',16)
ylabel('exterior velocity [m/s]','FontSize',16)
title('wake profile for rectangular prism','FontSize',16)
xlim([0,10])
