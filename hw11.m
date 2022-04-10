clear all; close all; clc;

B = readtable('Even Birthday Odd ZID.csv');
A = B{:,:};
%{
mean(A(1:end,2))
std(A(1:end,2))
%}
%^^^^---used to calculate stats


scatter(A(1:end,1),A(1:end,2))
figure
k = fft(A(1:end,2));
stem(real(k))
stem(imag(k))




%{
range = linspace(0,2*pi,2048);
sine = sin(range*3);
plot(range,sine)
figure;
p = fft(sine)
stem(real(p))
figure;
stem(imag(p))
figure;
stem(abs(p))
%}
