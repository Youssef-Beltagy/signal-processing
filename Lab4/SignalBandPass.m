% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% SignalBandPass - loads castanets44m.wav,
% Thens runs it through a band pass filter.
% The outputed is plotted and played.

% Load the sound signal
[ss, Fs] = audioread("castanets44m.wav");
ss = ss';
N = length(ss);
t = (0:(N-1)) ./ Fs;

% Set the frequency threshold in Hz
HPF_freq_threshold = 500;
LPF_freq_threshold = 2000;

% Prepare the filter
f = ((-N/2 + 1):(N/2))* Fs / N;
w = f * 2 * pi;
% the LPF
a = LPF_freq_threshold * 2 * pi; % convert to rad s^-1
Hlpf = a ./ (a + 1j .* w); % centered
% the HPF
a = HPF_freq_threshold * 2 * pi;
Hhpf = 1 - a ./ (a + 1j .* w);
% combined filter
H = Hlpf .* Hhpf;
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
title("BPF Signal");
xlabel("Time / s")
ylabel("Amplitude")

% Plot in Frequency Domain
figure();
layout = tiledlayout(3,1);
title(layout, "Frequency Domain Signals");

nexttile;
plot(f, abs(H));
title("BPF Frequency Response");
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