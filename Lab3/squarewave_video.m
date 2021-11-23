% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% Generates a video of a fourier series approximation
% of a square wave as the number of coefficients increases


t = -5:0.01:5; % the time
K_max = 5000;

for k=0:1:K_max;


y = squarewave(t, k);

pause(1/100); % 60 frames per second --> will be limited by the squarewave generation time

plot(t, y);
title(sprintf("Approximation with K_{max} = %d", k));
ylabel("Amplitude");
xlabel("Time (s)");

end
