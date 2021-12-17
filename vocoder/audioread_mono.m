% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% audioread_mono - loads a file
% as a monochannel sound signal
% arguments
%   i(1:1); % the index of the sentence

function [ss,Fs] = audioread_mono(i)
    [ss, Fs] = audioread(sprintf('sounds/sent%03d.wav',i));
    
    SIZE = size(ss);
    if(SIZE(2) > 1)
        ss = (ss(:,1) + ss(:,2)) ./ 2;
    end
end
