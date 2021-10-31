diary your_nameex1
%INSERT your name and section into these display commands
disp('NAME: your_name')
disp('SECTION: your_section')
datestr(cputime)

%dampedCosine.m produces a plot of a cosine with frequency 1 Hz, with amplitude
% scaled by a decaying exponential 

x = -5:0.01:5;
y=exp(-abs(x)).*cos(2*pi*x);
plot(x,y);
xlabel('time');
ylabel('amplitude');
title('f(x)=exp(-|x|)cos(2*pi*x)');

diary off