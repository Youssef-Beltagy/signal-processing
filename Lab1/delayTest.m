load fall
Fs = 8000;
t = (0:length(fall)-1)/Fs;

% Tests
assert(length(delay(fall,Fs,0.5)) == 24000)
assert(length(delay(fall,Fs,0.4)) == 24000)
assert(length(delay(fall,Fs,0)) == 24000)
assert(length(delay(fall,Fs,-0.4)) == 24000)
assert(length(delay(fall,Fs,-0.5)) == 24000)
assert(length(delay(fall,Fs,3)) == 24000)
assert(length(delay(fall,Fs,-3))== 24000)
assert(length(delay(fall,Fs,5)) == 24000)
assert(length(delay(fall,Fs,-5)) == 24000)

layout = tiledlayout(4,1);
title(layout,"Delay Function")

nexttile
plot(t, fall)
title("original")
xlabel("time")
ylabel("signal")

nexttile
plot(t, delay(fall,Fs, 1 - 5/8));
title("delayed 0.375 seconds");
xlabel("time")
ylabel("signal")

nexttile
plot(t, delay(fall,Fs, -5/8));
title("hastened 0.625 seconds");
xlabel("time")
ylabel("signal")

nexttile
plot(t, delay(fall,Fs,0));
title("delayed 0 seconds");
xlabel("time")
ylabel("signal")
