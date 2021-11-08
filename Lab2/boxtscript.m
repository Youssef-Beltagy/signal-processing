% Youssef Beltagy
% BEE235A, Au 2021, Lab 2
% boxtscript.m - boxplots with different time granularities

t05 = -3:0.5:3;
boxsig05 = boxt(t05,-1,1);

t01 = -3:0.1:3;
boxsig01 = boxt(t01,-1,1);

t001 = -3:0.01:3;
boxsig001 = boxt(t001, -1, 1);

% plotting
layout = tiledlayout(3,1);
title(layout, "Box Plots");

nexttile
plot(t05, boxsig05);
title("Boxplot with 0.5s granularity");
ylabel("amplitude");
xlabel ("time");

nexttile
plot(t01, boxsig01);
title("Boxplot with 0.1s granularity");
ylabel("amplitude");
xlabel ("time");

nexttile
plot(t001, boxsig001);
title("Boxplot with 0.01s granularity");
ylabel("amplitude");
xlabel ("time");

