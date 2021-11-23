% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% signal_synthesis_plot.m generates a plot of the trumpet sound and its
% fourier transform

load trumpet;
Fs = 11025;

% Play the trumpet -- part 2
sound(trumpet, Fs);
%pause(length(trumpet)/Fs);

% Plot the trumpet -- part 3
plot(trumpet(1:150));
title("Trumpet (Zoomed in)");
xlabel("Sample Number");
ylabel("Value");

% Plot the Frequency -- part 4 and 5
Y = fft(trumpet, 512);  % FFT (Fourier transform) of the trumpet sond 
Ymag = abs(Y)          % take the mag of Y 
f = Fs * (0:256)/512;   % get a meaningful frequency axis  
plot(f, Ymag(1:257));   % plot Ymag (only half the points are needed)
title("Trumpet FT (first seven)");
xlabel("Frequency (Hz)"); 
ylabel("Magnitude");

% Plot the Frequency -- part 6
figure()
Y = fft(trumpet, 512);  % FFT (Fourier transform) of the trumpet sond 
Ymag = abs(Y);          % take the mag of Y 
f = Fs * (0:256)/512;   % get a meaningful frequency axis  
plot(f, Ymag(1:257));   % plot Ymag (only half the points are needed)
title("Trumpet FT (strongest 10)");
xlabel("Frequency (Hz)"); 
ylabel("Magnitude");




