% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% chimera_run.m - A helper function
% to easily load sounds and run the chimera.
%arguments
%        i(1,1) int8 = 0; % the index of first sound to use
%        j(1,1) int8 = 1; % the index of the second sound to use
%        mode(1,1) string = "both"; % the running mode: original, chimera, both, reverse
%        num_bands(1,1) = 8; % chimera number of bands
%        chimera_mode(1,1) string = "no-swap";  % the chimera mode: swap, no-swap
%examples
%   chimera_run() % runs all 25 sounds and plays both original signals and
%   the chimera signal.
%   chimera_run(0) same as above
%   chimera_run(i,j) runs the chimera with sentences i and j which have to
%   be in the range [1,25];
%   chimera_run(i, j, mode) mode chooses whether you play just the original
%                       signals, just the chimera signal, all signals,
%                       or the original and chimera signals in reverse order.
%   chimera_run(i, j, mode, num_bands, chimera_mode) num_bands and chimera_mode
%                       specify different running modes for the chimera.
%                       num_bands decides the number of bands of the
%                       chimera.
%                       chimera_mode decides whether the chimera flips
%                       between the signals or not.

function chimera_run(i, j, mode, num_bands, chimera_mode)
    arguments
        i(1,1) int8 = 0; % the index of first sound to use
        j(1,1) int8 = 1; % the index of the second sound to use
        mode(1,1) string = "both"; % the running mode: original, chimera, both, reverse
        num_bands(1,1) = 8; % chimera number of bands
        chimera_mode(1,1) string = "no-swap";  % the chimera mode: swap, no-swap
    end

% Choose Mode
% defualt is to play both original and vocoded sound
play = @play_sound; 

if(strcmp(mode,'original'))
    play = @play_original;
elseif(strcmp(mode,'chimera'))
    play = @play_chimera;
elseif(strcmp(mode,'reverse'))
    play = @play_sound_rev;
end

if (j > 25 || j < 1)
    return
end

[sig2,Fs2] = audioread_mono(j);

% Play Sound    
if i == 0
    for n=1:25
    [sig1,Fs1] = audioread_mono(n);
    play(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
    end
elseif i > 0 && i <= 25
    [sig1,Fs1] = audioread_mono(i);
    play(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
end
    
end

function play_original(sig1, Fs1, sig2, Fs2, ~, ~)
    sound(sig1,Fs1);
    pause(length(sig1)/Fs1 + 0.5);
    sound(sig2,Fs2);
    pause(length(sig2)/Fs2 + 0.5);
end

function play_chimera(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode)
    [os,Fs] = chimera(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
    sound(os, Fs);
    pause(length(os)/Fs + 0.5);
end

function play_sound(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode)
    play_original(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
    play_chimera(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
end

function play_sound_rev(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode)
    play_chimera(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
    play_original(sig1, Fs1, sig2, Fs2, num_bands, chimera_mode);
end
