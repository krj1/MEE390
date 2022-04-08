clc; close all; clear all;

%-------For compairing alternitives through guess and cheak--------
P1 = 24000;
P2 = 17000;

A1 = 2500;
A2 = 1700;
%A2 = 38780;
%A2 = 26380;

percent1 = 10      /100;
percent2 = 9      /100;
n = 20;

dif = (P1 - P2) * -1;
anuity = A1 - A2;

pGiveA1 = ((percent1+1)^n - 1)/(percent1*(percent1+1)^n);
pGiveA2 = ((percent2+1)^n - 1)/(percent2*(percent2+1)^n);

error1 = anuity*pGiveA1+dif
error2 = anuity*pGiveA2+dif

ror = (percent1 + error1/(error1 - error2)*(percent2-percent1))*100
