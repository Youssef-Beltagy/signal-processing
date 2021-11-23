% Youssef Beltagy
% BEE235A, Aut 2021, Lab 2
% convolution.m - Experimenting with Matlab Convolution

h = [1 zeros(1,20) .5 zeros(1,10)]; % impulses make triangles
x = [0 1:10 ones(1,5)*5 zeros(1,40)]; 
y = conv(x,h);

layout = tiledlayout(3,1);
title(layout, "Convolution");

nexttile
plot([h zeros(1, length(y) - length(h))]);
title("h(t)");
ylabel("amplitude");
xlabel ("time");

nexttile
plot([x zeros(1, length(y) - length(x))])
title("x(t)")
ylabel("amplitude");
xlabel ("time");

nexttile
plot(y)
title("conv(x,h)")
ylabel("amplitude");
xlabel ("time");




