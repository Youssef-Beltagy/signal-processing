% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% rectifier_envelope.m - transform sent001.wav to a peak envelope

% load sent001.wav
[signal, Fs] = audioread('sent001.wav');

% rectify the speech signal
rectified_signal = abs(signal);

% pass it through a LPF @ 20 Hz
[bb, aa] = butter(2, 20/(Fs/2)); % 2nd-order LPF @ 20 Hz
filtered_signal = filter(bb, aa, rectified_signal);

% Calculate time
L = length(signal);
Ts = 1 / Fs;
t = [0:Ts:(L-1)*Ts];

% Plot sent001.wav raw
subplot(2,1,1);
plot(t, signal);
title('sent001.wav');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot sent001.wav envelope
subplot(2,1,2);
plot(t, filtered_signal);
title('sent001.wav amplitude envelope');
xlabel('Time (s)');
ylabel('Amplitude');
