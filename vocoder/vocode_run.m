function vocode_run(i, mode, num_bands)
    arguments
        i(1,1) int8 = 0;
        mode(1,1) string = "both";
        num_bands(1,1) = 8;
    end

% Choose Mode
% defualt is to play both original and vocoded sound
play = @play_sound; 

if(strcmp(mode,'original'))
    play = @play_original;
elseif(strcmp(mode,'vocode'))
    play = @play_vocode;
elseif(strcmp(mode,'reverse'))
    play = @play_sound_rev;
end

% Play Sound    
if i == 0
    for n=1:25
    [ss,Fs] = audioread_mono(n);
    play(ss, Fs, num_bands);
    end
elseif i > 0 && i <= 25
    [ss, Fs] = audioread_mono(i);
    play(ss, Fs, num_bands);
end
    
end

function [ss,Fs] = audioread_mono(i)
    [ss, Fs] = audioread(sprintf('sounds/sent%03d.wav',i));
    
    SIZE = size(ss);
    if(SIZE(2) > 1)
        ss = (ss(:,1) + ss(:,2)) ./ 2;
    end
end

function play_original(ss, Fs, num_bands)
sound(ss,Fs);
pause(length(ss)/Fs + 0.5);
end

function play_vocode(ss,Fs, num_bands)
sound(vocode(ss,Fs,num_bands),Fs);
pause(length(ss)/Fs + 0.5);
end

function play_sound(ss, Fs, num_bands)
    play_original(ss,Fs, num_bands);
    play_vocode(ss,Fs, num_bands);
end

function play_sound_rev(ss, Fs, num_bands)
    play_vocode(ss,Fs, num_bands);
    play_original(ss,Fs, num_bands);
end
