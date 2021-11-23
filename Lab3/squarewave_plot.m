% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% plots fourier series representations of a squarewave


t = -5:0.01:5; % the time
K_max = [5, 15, 30]; % all values of K_max to use


layout = tiledlayout(length(K_max),1);
title(layout, "Square Wave Approximations with Fourier Series (Youssef and Samuel)");

for i=1:length(K_max)


y = squarewave(t, K_max(i));

nexttile;
plot(t, y);
title(sprintf("Approximation with K_{max} = %d", K_max(i)));
ylabel("Amplitude");
xlabel("Time (s)");
end
