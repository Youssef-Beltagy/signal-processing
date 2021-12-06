% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% SignalLowPass - loads castanets44m.wav,
% Thens runs it through a low pass filter.
% The output is plotted and played.

% Load the data
LoadData;

% Prepare the filter
a = 500 * 2 * pi; % rad s^-1
H = a ./ (a + 1j .* w); % centered
Hshift = fftshift(H); % shifted

% Run the filter
FT_ss = fft(ss); % shifted
FT_os = FT_ss .* Hshift; % shifted
os = real(ifft(FT_os)); % just real components 

PlotSignals(t, ss, os, f, H, FT_ss, FT_os, '500Hz LPF');
PlaySignals(ss, os, Fs);