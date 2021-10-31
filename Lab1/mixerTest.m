
load doit
load handel

N = max(length(y), length(doit));
t = (0:(N-1))/Fs;

layout = tiledlayout(3,1);
title(layout,"Mixer Function")

nexttile
plot(t, [doit; zeros(N-length(doit),1)])
title("doit")
xlabel("time")
ylabel("signal")

nexttile
plot(t, [y; zeros(N-length(y),1)])
title("handel")
xlabel("time")
ylabel("signal")


nexttile
plot(t, mixer(doit,y))
title("mixed")
xlabel("time")
ylabel("signal")

sound(doit,Fs);
pause;

sound(y, Fs);
pause;

sound(mixer(y,doit),Fs);