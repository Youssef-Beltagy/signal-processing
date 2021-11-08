% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% rectifier_envelope.m - transform sent001.wav to a peak envelope

function rectifier_envelope()
% load sent001.wav
[signal, Fs] = audioread('sent001.wav');

% full-rectification the speech signal
rectified_signal = abs(signal);

% pass it through a LPF @ 20 Hz
[bb, aa] = butter(2, 20/(Fs/2)); % 2nd-order LPF @ 20 Hz
filtered20_signal = filter(bb, aa, rectified_signal);

% Calculate time
L = length(signal);
Ts = 1 / Fs;
t = 0:Ts:(L-1)*Ts;

layout = tiledlayout(3,1);
title(layout, "Envelope");

% Plot sent001.wav raw
nexttile;
plot(t, signal);
title('sent001.wav');
xlabel('Time (s)');
ylabel('Amplitude');

% Rectified
nexttile;
plot(t, rectified_signal);
title('sent001.wav Rectified');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot sent001.wav envelope @ 20HZ
nexttile;
plot(t, filtered20_signal);
title('sent001.wav amplitude envelope -- 20Hz filter');
xlabel('Time (s)');
ylabel('Amplitude');


% More plots

% pass it through a LPF @ 5, 50, 500 Hz
[bb, aa] = butter(2, 5/(Fs/2)); % 2nd-order LPF @ 5 Hz
filtered5_signal = filter(bb, aa, rectified_signal);

[bb, aa] = butter(2, 50/(Fs/2)); % 2nd-order LPF @ 50 Hz
filtered50_signal = filter(bb, aa, rectified_signal);

[bb, aa] = butter(2, 500/(Fs/2)); % 2nd-order LPF @ 500 Hz
filtered500_signal = filter(bb, aa, rectified_signal);

figure();
layout = tiledlayout(3,1);
title(layout, "Envelope (5Hz, 50 Hz, 500 Hz)");

% Plot sent001.wav envelope @ 5HZ
nexttile;
plot(t, filtered5_signal);
title('sent001.wav amplitude envelope -- 5Hz filter');
xlabel('Time (s)');
ylabel('Amplitude');


% Plot sent001.wav envelope @ 50HZ
nexttile;
plot(t, filtered50_signal);
title('sent001.wav amplitude envelope -- 50Hz filter');
xlabel('Time (s)');
ylabel('Amplitude');


% Plot sent001.wav envelope @ 500HZ
nexttile;
plot(t, filtered500_signal);
title('sent001.wav amplitude envelope -- 500Hz filter');
xlabel('Time (s)');
ylabel('Amplitude');

end
