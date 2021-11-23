% Samuel Hunter
% BEE235A, Au 2021, Lab 2
% signal_synthesis.m - Synthesize a trumpet sound from multiple sine waves.

Fs = 11025; % Sample rate of 11.025 kHz
t = 0:1/Fs:2; % Two-second time vector at Fs

% 10 most powerful sine waves from the sampled signal, sorted by
% magnitude.
freq = [ 
    796.729;
	1335.06;
	1055.13;
	1593.46;
	538.330;
	1851.86;
	2390.19;
	2648.58;
	2110.25;
	258.398];

mag = [ 
    65.114;
	52.593;
	52.244;
	38.994;
	37.749;
	28.305;
	15.724;
	15.208;
	12.487;
	11.795];

% Add up all sine waves
synthesized = zeros(size(t));
for i = 1:length(freq)
	synthesized = synthesized + mag(i)*cos( (2 * pi * freq(i)) .* t);
end

% Normalize signal to -1:1.
synthesized = synthesized ./ max(abs(synthesized));


% Plotting the synthesized signal
plot(t, synthesized);
title('Synthesized Trumpet Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');


figure();

% Comparing the original and synthesized signal.
layout = tiledlayout(2,1);
title(layout, "Trumpet Signal Comparison");

nexttile;
plot(t, trumpet(1:length(t)));
title('Original Trumpet Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

nexttile;
plot(t, synthesized);
title('Synthesized Trumpet Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');


figure();

% Comparing the original and synthesized signal (Zoomed In)
layout = tiledlayout(2,1);
title(layout, "Trumpet Signal Comparison (Zoomed In)");

nexttile;
plot(t(1:150), trumpet(1:150));
title('Original Trumpet Signal (Zoomed In)');
xlabel('Time (seconds)');
ylabel('Amplitude');

nexttile;
plot(t(1:150), synthesized(1:150));
title('Synthesized Trumpet Signal (Zoomed In)');
xlabel('Time (seconds)');
ylabel('Amplitude');
 
% Playing the sounds
sound(trumpet, Fs);
pause(length(trumpet)*2/Fs);
sound(synthesized, Fs);






