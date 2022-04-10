clear all; close all; clc;

B = readtable('Even Birthday Odd ZID.csv');
A = B{:,:};

%{
mean(A(1:end,2))
std(A(1:end,2))
%}
%^^^^---used to calculate stats----




k = fft(A(1:end,2)); %plots fft of crap data
stem(abs(k))
figure


%-------------this block isolates the harmonics form the noise, harmonic every 22 stems---------
normal = [real(k(1))];
imagine = [imag(k(1))];

real_num = normal
imaginary_num = imagine

for i = 22:22:2048/2
    real_num = [real_num; mean([real(0.9*k(i-1)),1.2*real(k(i)),0.9*real(k(i+1))])];  %this saves the real numbers so a table can be made
    normal = [normal; zeros(21,1)];                                                   %this makes all the stems we don't care about zeros
    normal = [normal; mean([real(0.9*k(i-1)),1.2*real(k(i)),0.9*real(k(i+1))])];      %this saves the harmonics
    imaginary_num = [imaginary_num; mean([imag(0.9*k(i-1)),1.2*imag(k(i)),0.9*imag(k(i+1))])];%this saves the imaginary numbers so a table can be made
    imagine = [imagine; zeros(21,1)];                                                 %this makes all the stems we don't care about zeros
    imagine = [imagine; mean([imag(0.9*k(i-1)),1.2*imag(k(i)),0.9*imag(k(i+1))])];    %this saves the harmonics
    
end

%-----------------------------------------------------------------------------------------------



n = 1:1:2075/44;

normal = [normal; zeros(1000,1)];%this adds crap on the end so don't get error when ploting
imagine = [imagine; zeros(1000,1)];

clean = normal + imagine*1i; %makes new vector with only harmonics
clean = clean(2:end) * 6; %scales signal bc pohlman told me to
stem(abs(clean));
figure
s = scatter(A(1:582,1),A(1:582,2),'filled')
s.AlphaData = ones(582,1); %makes data points translucent
s.MarkerFaceAlpha = 'flat'; 
hold on;
sig = ifft(clean); %takes inverse fft of clean data

plot(A(1:582,1), sig(1:582,1)) % plots "signal"




%------------- this block makes table for part 5 --------------------------

n = n';
n = n - 1;
n = n(2:end);
real_num = real_num(2:end);
imaginary_num = imaginary_num(2:end);
table(n,real_num,imaginary_num)

%--------------------------------------------------------------------------





%----this code block is to test fft with a sine wave to help understand fft----
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


