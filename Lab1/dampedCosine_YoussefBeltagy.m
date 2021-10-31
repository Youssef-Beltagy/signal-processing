%Youssef Beltagy
%EE235 Autumn 2021, lab 1
%dampedCosine.m
%produces a plot of a cosine with frequency 1 Hz, with amplitude
%scaled by a decaying exponential (y)
%and another cosine of frequency 0.5 Hz under that.

diary Yousser_Beltagy
disp('NAME: Youssef Beltagy')
disp('SECTION: Chicken Section')
datestr(cputime)

layout = tiledlayout(2,1);
title(layout, "Exercise 3: Dambed Cosine");
nexttile

x = -5:0.01:5;
y=exp(-abs(x)).*cos(2*pi*x);
plot(x,y);
xlabel('time');
ylabel('amplitude');
title('f(x)=e^{-|x|}cos(2\pi x)');

nexttile

y=exp(-abs(x)).*cos(pi*x);
plot(x,y);
xlabel('time');
ylabel('amplitude');
title('f(x)=e^{-|x|}cos(\pi x)');

diary off