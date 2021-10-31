time = 0:0.01:1;
y = cos(time .* pi .*25);

plot(time, fade(y,0));
ylabel("value")
xlabel("time")
title("Fade 0");
pause;

plot(time, fade(y,0.1));
title("Fade 0.1");
pause;

plot(time, fade(y,0.2));
title("Fade 0.2");
pause;

plot(time, fade(y,0.5));
title("Fade 0.5");
pause;

plot(time, fade(y,0.7));
title("Fade 0.7");
pause;

plot(time, fade(y,0.8));
title("Fade 0.8");
pause;

plot(time, fade(y,1));
title("Fade 1");
pause;