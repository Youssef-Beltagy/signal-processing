% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% gibbs.m - plots coefficients of a fourier series representing a square wave


k = -10:1:10;
C_k = Ck(k);
w = (pi / 3) * k; % 2 pi * F == 2 pi * 1 / T == 2 pi / 6

layout = tiledlayout(2,1);
title(layout, "Square Wave Fourier Series Coefficients");

nexttile
stem(w, abs(C_k));
title("Magnitude");
ylabel("Value");
xlabel("Angular Frequency \omega (rad s^{-1})");

nexttile
stem(w, angle(C_k));
title("Phase");
ylabel("Value");
xlabel("Angular Frequency \omega (rad s^{-1})");


pause();
squarewave_plot();
