% Youssef Beltagy
% BEE235A, Au 2021, Lab 2
% exercise5.m - Convolving fall

load fall

fall = fall'; % convert fall into a row vector
h2 =[ones(1,50)/20 zeros(1,20)];
y2 = conv(fall, h2);

%plotting
layout = tiledlayout(4,1);
title(layout, "Exercise 5");

nexttile
plot(h2);
title("h(t)");
xlabel('Time (s)');
ylabel('Amplitude');

nexttile
plot([h2 zeros(1, length(y2) - length(h2))]);
title("h(t) with same time scale as output");
xlabel('Time (s)');
ylabel('Amplitude');

nexttile
plot([fall zeros(1, length(y2) - length(fall))])
title("fall")
xlabel('Time (s)');
ylabel('Amplitude');

nexttile
plot(y2)
title("conv(fall,h)")
xlabel('Time (s)');
ylabel('Amplitude');

% Play the sounds 
sound(fall);
pause(4);
sound(y2); %muffled weaker sound