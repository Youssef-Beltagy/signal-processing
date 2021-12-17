% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% plots.m - Generates plots

[ss, Fs] = audioread("sounds/sent007.wav");

make_spectrogram(ss,Fs,"Original Signal Spectrogram");

os = vocode(ss,Fs,1);
make_spectrogram(os,Fs,"Vocoded (1 sine band) Signal Spectrogram");

os = vocode(ss,Fs,4);
make_spectrogram(os,Fs,"Vocoded (4 sine band) Signal Spectrogram");

plot_input_output(ss, os, Fs);

os = vocode(ss,Fs,1, "noise");
make_spectrogram(os,Fs,"Vocoded (1 noise band) Signal Spectrogram");

os = vocode(ss,Fs,4, "noise");
make_spectrogram(os,Fs,"Vocoded (4 noise band) Signal Spectrogram");

plot_lpf(Fs);

function make_spectrogram(ss,Fs,plot_title)
figure();
[s, f, t] = spectrogram(ss, hamming(512), 4, 1024, Fs); 
surf(t, f, 20*log10(abs(s)), 'EdgeColor', 'none'); 
colormap(jet);
view(0,90);
title(plot_title);
xlabel("Time / s");
ylabel("Frequency / Hz");
end

function plot_lpf(Fs)
figure()
[bb,aa]=butter(2,400/(Fs/2));
[H,F]=freqz(bb,aa,256,Fs); 
plot(F,abs(H));
title("LPF Filter");
ylabel("Amplitude");
xlabel("Frequency / Hz");
xlim([0 6000]);
ylim([0,1]);
end

function plot_input_output(ss, os, Fs)
t = (0:(length(ss) - 1)) ./ Fs;

figure();
layout = tiledlayout(2,1);
title(layout, "Sentence 7 Input/Output with 4 sine bands");

nexttile;
plot(t, ss)
title("Input");
ylabel("Amplitude");
xlabel("Time / s");

nexttile;
plot(t, os)
title("Output");
ylabel("Amplitude");
xlabel("Time / s");
end