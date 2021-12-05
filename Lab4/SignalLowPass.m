% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% SignalLowPass - loads castanets44m.wav,
% Thens runs it through a low pass filter.
% The outputed is plotted and played.

% Load the sound signal
[ss, Fs] = audioread("castanets44m.wav");
ss = ss';
N = length(ss);
t = (0:(N-1)) ./ Fs;

% Set the frequency threshold in Hz
freq_threshold = 500; 

% Prepare the filter
f = ((-N/2 + 1):(N/2))* Fs / N;
w = f * 2 * pi;
a = freq_threshold * 2 * pi; % convert to rad s^-1
H = a ./ (a + 1j .* w); % centered
Hshift = fftshift(H); % shifted

% Run the filter
FT_ss = fft(ss); % shifted
FT_os = FT_ss .* Hshift; % shifted
os = real(ifft(FT_os)); % just real components 

% Plot in time domain
layout = tiledlayout(2,1);
title(layout, "Time Domain Signals");

nexttile;
plot(t,ss);
title("Source Signal");
xlabel("Time / s")
ylabel("Amplitude")

nexttile;
plot(t,os);
title("LPF Signal");
xlabel("Time / s")
ylabel("Amplitude")

% Plot in Frequency Domain
figure();
layout = tiledlayout(3,1);
title(layout, "Frequency Domain Signals");

nexttile;
plot(f, abs(H));
title("LPF Frequency Response");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

nexttile;
plot(f, abs(fftshift(FT_ss)));
title("Original Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

nexttile;
plot(f, abs(fftshift(FT_os)));
title("Filtered Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

% Play the sounds
sound(ss); pause(N/Fs * 2);
sound(os); pause(N/Fs * 2);
soundsc(ss); pause(N/Fs * 2);
sound(os); pause(N/Fs * 2);