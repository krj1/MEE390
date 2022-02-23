clear all; close all;

B = readtable('Lab2p2.csv');
A = B{:,:};

x = A(:,5);
y = A(:,4);
co = polyfit(x,y,1);
co2 = polyfit(x,y,2);
range = .03:.01:1.13;
bf = co(1)*range+co(2);
bf2 = co2(1)*range.^2 + co2(2)*range+ co2(3);

f = figure;

w = eye(20);

w(9,9) = 100;
w(10,10) = 100;
w(11,11) = 100;
w(12,12) = 100;

w(5,5) = 50;
w(6,6) = 50;
w(7,7) = 50;
w(8,8) = 50;

w(13,13) = 50;
w(14,14) = 50;
w(15,15) = 50;
w(16,16) = 50;

M = [ones(20,1),x]
co3 = inv(M'*w^(1/2)*M)*M'*w^(1/2)*y
bf3 = co3(2)*range+co3(1);

p = eye(20);

p(9,9) = 1;
p(10,10) = 1;
p(11,11) = 1;
p(12,12) = 1;

p(1,1) = 5;
p(2,2) = 5;
p(3,3) = 5;
p(4,4) = 5;

p(17,17) = 5;
p(18,18) = 5;
p(19,19) = 5;
p(20,20) = 5;


M = [ones(20,1),x]
co4 = inv(M'*p^(1/2)*M)*M'*p^(1/2)*y
bf4 = co4(2)*range+co4(1);


scatter(x,y,'r', 'square', 'filled')
hold on

plot(range, bf, 'b--')
plot(range, bf2, 'g--')
plot(range, bf3, 'r--')
plot(range, bf4, 'k--')
xlabel('Strain [in/in]','FontSize',14)
ylabel('Volts [V]','FontSize',14)

legend('experimental data','Linear: $y=2.21x-0.0107$','Quadratic: $y=0.6604x^2+2.116x-0.007$','100x weighted: $y=2.234x-0.013$','5x weighted: $y=2.209x-0.0098$','FontSize',14,'Location','southeast','Interpreter','latex')


set(f,'KeyPressFcn',@myfun);
function myfun(src,event)
   if event.Key == 'x' | event.Key == 'X' 
       close(src);
   end
end