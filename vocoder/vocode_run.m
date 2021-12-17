% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% vocode_run.m - A helper function
% to easily load sounds and run the vocoder.
% arguments
%        i(1,1) int8 = 0; % the index of sound to use
%        mode(1,1) string = "both"; % the running mode: original, vocode, both, reverse
%        num_bands(1,1) = 8; % Vocoder number of bands
%        vocode_mode(1,1) string = "sine"; % the vocoder mode: sine, noise
% examples
%   vocode_run() % runs all 25 sounds and plays both original and vocoded
%   signal
%   vocode_run(0) same as above
%   vocode_run(i) runs the sentence number i. i must be in range [1,25]
%   vocode_run(i,mode) mode chooses whether you play just the original
%                       signal, just the vocoded signal, both, or both in
%                       reverse order.
%   vocode_run(i, mode, num_bands, vocode_mode) num_bands and vocode_mode
%                       specify different running modes for the vocoder.
%                       num_bands decides the number of bands of the
%                       vocoder.
%                       vocode_mode decides whether the vocoder uses a sine
%                       wave or white noise.

function vocode_run(i, mode, num_bands, vocode_mode)
    arguments
        i(1,1) int8 = 0; % the index of sound to use
        mode(1,1) string = "both"; % the running mode: original, vocode, both, reverse
        num_bands(1,1) = 8; % Vocoder number of bands
        vocode_mode(1,1) string = "sine"; % the vocoder mode: sine, noise
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
    play(ss, Fs, num_bands, vocode_mode);
end
    
end

function play_original(ss, Fs, ~, ~)
sound(ss,Fs);
pause(length(ss)/Fs + 0.5);
end

function play_vocode(ss, Fs, num_bands, vocode_mode)
sound(vocode(ss, Fs, num_bands, vocode_mode), Fs);
pause(length(ss)/Fs + 0.5);
end

function play_sound(ss, Fs, num_bands, vocode_mode)
    play_original(ss, Fs, num_bands, vocode_mode);
    play_vocode(ss, Fs, num_bands, vocode_mode);
end

function play_sound_rev(ss, Fs, num_bands, vocode_mode)
    play_vocode(ss,Fs, num_bands, vocode_mode);
    play_original(ss,Fs, num_bands, vocode_mode);
end
