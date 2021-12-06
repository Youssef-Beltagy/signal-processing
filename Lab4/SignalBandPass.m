% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% SignalBandPass - loads castanets44m.wav,
% Thens runs it through a band pass filter.
% The output is plotted and played.


% Load the data
LoadData;

% the LPF
a = 2000 * 2 * pi; % convert to rad s^-1
Hlpf = a ./ (a + 1j .* w); % centered

% the HPF
a = 500 * 2 * pi;
Hhpf = 1 - a ./ (a + 1j .* w);
% combined filter
H = Hlpf .* Hhpf;
Hshift = fftshift(H); % shifted

% Run the filter
FT_ss = fft(ss); % shifted
FT_os = FT_ss .* Hshift; % shifted
os = real(ifft(FT_os)); % just real components 

PlotSignals(t, ss, os, f, H, FT_ss, FT_os, '500-2000Hz BPF');
PlaySignals(ss, os, Fs);