% Samuel Hunter
% BEE 235A, Au 2021, Lab 2
% graph_rectifiers.m - Graph sent001.wav as-is and applied to both a
%                      half-wave and full-wave rectifier.

[signal, Fs] = audioread('sent001.wav');
full_rectified_signal = abs(signal);
half_rectified_signal = max(0, signal);

L = length(signal);
Ts = 1 / Fs;
t = 0:Ts:(L-1)*Ts;

% Play the sounds
sound(signal, Fs);
pause(4);
sound(full_rectified_signal, Fs);
pause(4);
sound(half_rectified_signal, Fs);
pause(4);

% Graph t=0.2 to t=0.3
t = t(0.2*Fs:0.3*Fs);
signal = signal(0.2*Fs:0.3*Fs);
full_rectified_signal = full_rectified_signal(0.2*Fs:0.3*Fs);
half_rectified_signal = half_rectified_signal(0.2*Fs:0.3*Fs);

% Graph raw
subplot(3,1,1);
plot(t, signal);
title('sent001.wav, not rectified');
xlabel('Time');
ylabel('Amplitude');

% Graph full-rectified-signal
subplot(3,1,2);
plot(t, full_rectified_signal);
title('sent001.wav, full-rectified');
xlabel('Time');
ylabel('Amplitude');

% Graph half-rectified signal
subplot(3,1,3);
plot(t, half_rectified_signal);
title('sent001.wav, half-rectified');
xlabel('Time');
ylabel('Amplitude');


