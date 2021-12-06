% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% LoadData - loads castanets44m.wav and 
% prepares time and frequency vectors


[ss, Fs] = audioread("castanets44m.wav");
ss = ss';
N = length(ss);
t = (0:(N-1)) ./ Fs;
f = ((-N/2 + 1):(N/2))* Fs / N;
w = f * 2 * pi;