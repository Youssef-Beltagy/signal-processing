for i=1:15
[ss,Fs] = audioread(sprintf('sent%03d.wav',i));
play_sound(ss,Fs);
end

function play_sound(ss,Fs)
sound(ss,Fs);
pause(length(ss)/Fs + 0.5);
sound(vocode(ss,Fs,8),Fs);
pause(length(ss)/Fs + 0.5);
end
