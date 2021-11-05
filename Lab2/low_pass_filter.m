% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% low_pass_filter.m - graph sent001.wav through a LPF

[signal, Fs] = audioread('sent001.wav');
[bb, aa] = butter(2, 500/(Fs/2)); % 2nd-order LPF @ 500 Hz
filtered_signal = filter(bb, aa, signal);

L = length(signal);
Ts = 1 / Fs;
t = [0:Ts:(L-1)*Ts];

% Slice for graphing for t=0.2 to t=0.3
t = t(0.2*Fs:0.3*Fs);
signal = signal(0.2*Fs:0.3*Fs);
filtered_signal = filtered_signal(0.2*Fs:0.3*Fs);

% Plot sent001.wav raw
subplot(2,1,1);
plot(t, signal);
title('sent001.wav, no filter');
xlabel('Time');
ylabel('Amplitude');

% Plot sent001.wav, filtered
subplot(2,1,2);
plot(t, filtered_signal);
title('sent001.wav, low-pass filter @ 500 Hz');
xlabel('Time');
ylabel('Amplitude');
