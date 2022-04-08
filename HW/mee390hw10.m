close all; clear all; clc;
halfPer = 8.6;
t = 0:halfPer/100:17.2*3;

B = readtable('MEE390Lab1PartC.csv');
A = B{:,:};

k = [];
for i = 1:1:length(t)
    p = 200;

    p2 = 128;
    if mod(i,p) >= p2
        k = [k,-3.49];
    else
        k = [k,1.96];
    end
end



ans = fourier(t);



t = t/1000;
plot(t,k)
figure;
crap = 95;
shit = 220;
scatter(A(crap:shit,5)-.005,A(crap:shit,6),4)
figure;
plot(t, ans)
function F = fourier(f)
    keeper = 0;
    
    for n = 1:1:12
        keeper = keeper + (2*5.46/(n*pi))*sin(.64*n*pi)*cos(2*pi*n*f/17.2)%1./n.*sin(n.*pi.*f./8.6);

    end
    F =keeper;
end

%(1/n*pi)*(3*sin(n*2*pi*4/3)- 4*sin(n*2*pi/3*2) +sin(n*2*pi/3*5));
%