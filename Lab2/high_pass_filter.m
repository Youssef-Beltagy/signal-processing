% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% high_pass_filter.m - graph sent001.wav through a HPF
function high_pass_filter()
[signal, Fs] = audioread('sent001.wav');
[bb, aa] = butter(2, 4000/(Fs/2), 'high'); % 2nd-order LPF @ 4 kHz
filtered_signal = filter(bb, aa, signal);

% Analyze the filter
fvtool(bb,aa);

sound(signal, Fs);
pause(4);
sound(filtered_signal, Fs);

L = length(signal);
Ts = 1 / Fs;
t = 0:Ts:(L-1)*Ts;

% Graph t=0.2 to t=0.3
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
title('sent001.wav, high-pass filter @ 4000 Hz');
xlabel('Time');
ylabel('Amplitude');
end
