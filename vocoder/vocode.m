% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% vocode.m - The vocoder.
% arguments
%        ss(:,:); % input sound signal
%        Fs(1,1); % signal sampling frequency
%        num_bands(1,1) = 8; % number of input bands
%        mode(1,1) = "sine"; % whether to use a sine wave 
%        % or white noise as the carrier.
%        % mode: sine, noise
%        fmin(1,1) = 300; % minimum frequency to use in the bands.
%        fmax(1,1) = 6000; % maximum frequency to use in the bands.

function os = vocode(ss, Fs, num_bands, mode, fmin, fmax)
   arguments
        ss(:,:); % input sound signal
        Fs(1,1); % signal sampling frequency
        num_bands(1,1) = 8; % number of input bands
        mode(1,1) = "sine"; % whether to use a sine wave 
        % or white noise as the carrier.
        % mode: sine, noise
        fmin(1,1) = 300; % minimum frequency to use in the bands.
        fmax(1,1) = 6000; % maximum frequency to use in the bands.
   end

SIZE = size(ss);

if SIZE(1) > 1
    ss = ss';
end

N = length(ss);
t = ( 0:(N - 1) ) ./ Fs;

% Low Pass Filter to make envelope
[lpf_bb,lpf_aa]=butter(2,400/(Fs/2));

cutoffs = bands_cutoff(fmin, fmax, num_bands);

os = zeros(1, N); % output signal

for i=1:num_bands
    % Band Pass Filter
    [bpf_bb,bpf_aa]=butter(3,[cutoffs(i) cutoffs(i+1)] ./ (Fs/2));
    
    % Get Band
    band = filter(bpf_bb, bpf_aa, ss);
        
    %Generate Envelope
    envelope = abs(band);
    envelope = filter(lpf_bb, lpf_aa, envelope);
    
    band = generate_carrier(mode, cutoffs(i), cutoffs(i + 1), bpf_bb, bpf_aa, t);
    band = band .* envelope;
    
    band = filter(bpf_bb, bpf_aa, band);% pass band through BPF again
            
    os = os + band;
end

os = os ./ max(abs(os)); %normalize

if SIZE(1) > 1
    os = os';
end

end

function carrier=generate_carrier(mode, fmin, fmax, bpf_bb, bpf_aa, t)
    if (strcmp(mode,"noise"))
        carrier = -1 + 2 .* rand(size(t));
        carrier = filter(bpf_bb, bpf_aa, carrier);
    else
        carrier = sin(pi .* (fmin + fmax) .* t );
    end
end