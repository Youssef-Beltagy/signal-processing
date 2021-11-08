% Youssef Beltagy
% BEE235A, Au 2021, Lab 2
% exercise10.m - Convoluting two box plots

% Time Signal Parameters
del = 0.001;
st = -5;
ed = 10;

% Generate time signal
t = st:del:ed;

% Generate two box plots
h = boxt(t, 0, 4); % (0,4)
x = boxt(t, -1, 1); % (-1,1)

% Generate output
y = conv(x,h,'full')*del;
% multiply by del to compensate for the fact a continous signal
% is represented in discrete format


% Plotting
layout = tiledlayout(3,1);
title(layout, "Exercise 10");

nexttile
plot(t, h);
title("h(t)");
xlabel('Time (s)');
ylabel('Amplitude');

nexttile
plot(t,x)
title("x(t)")
xlabel('Time (s)');
ylabel('Amplitude');

nexttile
plot(2*st:del:2*ed,y)
title("conv(x,h)")
xlabel('Time (s)');
ylabel('Amplitude');