% Exercise 6
load fall

fall = fall'; % convert fall into a row vector
h2 =[ones(1,50)/20 zeros(1,20)];
y2 = conv(fall, h2);

% Plotting
layout = tiledlayout(2,1);
title(layout, "Exercise 6");

nexttile
plot(6400:6500, fall(6400:6500));
title("fall (zoomed in)");
ylabel("amplitude");
xlabel ("time");

nexttile
plot(6400:6500, y2(6400:6500));
title("conv(fall,h) (zoomed in)")
ylabel("amplitude");
xlabel ("time");


