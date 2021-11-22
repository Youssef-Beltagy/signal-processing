% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% signal_synthesis.m - Synthesize a trumpet sound from multiple sine waves.

Fs = 11025 % Sample rate of 11.025 kHz
t = 0:1/Fs:2; % Two-second time vector at Fs

% 10 most powerful sine waves from the sampled signal, sorted by
% magnitude.
freq = [ 796.729;
	1335.06;
	1055.13;
	1593.46;
	 538.33;
	1851.86;
	2390.19;
	2648.58;
	2110.25;
	 258.398];

mag = [ 65.114;
	59.593;
	52.244;
	38.994;
	37.749;
	28.305;
	15.724;
	15.208;
	12.487;
	11.795];

% Add up all sine waves
sampled = t .* 0;
for i = 1:length(freq)
	sampled = sampled + mag(i)*cos(2*pi*freq(i)*t);
end

% Normalize signal to -1:1.
sampled = sampled ./ max(abs(sampled));

plot(t, sampled);
title('Trumpet signal from additive synthesis');
xlabel('Time (seconds)');
ylabel('Amplitude');
