% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% SignalHighPass - loads castanets44m.wav,
% Thens runs it through a high pass filter.
% The output is plotted and played.

% Load the data
LoadData;

% Prepare the filter
a = 2000 * 2 * pi; % convert to rad s^-1
H = 1 - a ./ (a + 1j .* w); % centered
Hshift = fftshift(H); % shifted

% Run the filter
FT_ss = fft(ss); % shifted
FT_os = FT_ss .* Hshift; % shifted
os = real(ifft(FT_os)); % just real components 

PlotSignals(t, ss, os, f, H, FT_ss, FT_os, '2000Hz HPF');
PlaySignals(ss, os, Fs);