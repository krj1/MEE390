

t = linspace(0,6*pi/4,31);
gt1 = 6 - 8 * sin(4*t-2.45);

t2 = linspace(0,6*pi/4,59);
gt2 = 6 - 8 * cos(4*t2-(2.45+pi/2));

t3 = linspace(0,6*pi/4,96);
gt3 = 6 - (- 5.9169766*sin(4*t3) -4.899357*cos(4*t3));

f = figure;
plot(t,gt1)
hold on
plot(t2,gt2)
plot(t3,gt3)
hold off

ylabel('Amplitude','FontSize',18);
xlabel('Time [s]','FontSize',18);
title('sinusoidal functions vs. Time [s]','FontSize',20)
%legend('sine-only','cosine-only','sine & cosine','FontSize',20x)


set(f,'KeyPressFcn',@myfun);
function myfun(src,event)
   if event.Key == 'x' | event.Key == 'X' 
       close(src);
   end
end