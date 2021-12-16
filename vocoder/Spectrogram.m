
[ss, Fs] = audioread("sounds/sent007.wav");
make_spectrogram(ss,Fs,"Original Signal Spectrogram");

figure();
os = vocode(ss,Fs,1);
make_spectrogram(os,Fs,"Vocoded (1 sine band) Signal Spectrogram");

figure();
os = vocode(ss,Fs,4);
make_spectrogram(os,Fs,"Vocoded (4 sine band) Signal Spectrogram");

figure();
os = vocode(ss,Fs,1, "noise");
make_spectrogram(os,Fs,"Vocoded (1 noise band) Signal Spectrogram");

figure();
os = vocode(ss,Fs,4, "noise");
make_spectrogram(os,Fs,"Vocoded (4 noise band) Signal Spectrogram");

function make_spectrogram(ss,Fs,plot_title)
[s, f, t] = spectrogram(ss, hamming(512), 4, 1024, Fs); 
surf(t, f, 20*log10(abs(s)), 'EdgeColor', 'none'); 
colormap(jet);
view(0,90);
title(plot_title);
xlabel("Time / s");
ylabel("Frequency / Hz");
end