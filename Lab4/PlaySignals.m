% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% PlaySignals - plays the two signals
% once with sound another with soundsc

function PlaySignals(ss, os, Fs)

% Play the sounds
sound(ss, Fs); pause(8);
sound(os, Fs); pause(8);

soundsc(ss, Fs); pause(8);
soundsc(os, Fs); pause(8);

end