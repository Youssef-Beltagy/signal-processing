function os = vocode(ss, Fs, num_bands)

N = size(ss);

if N(1) > 1
    ss = ss';
end

N = length(ss);
t = ( 0:(N - 1) ) ./ Fs;

[lpf_bb,lpf_aa]=butter(2,400/(Fs/2));

cutoffs = bands_cutoff(300, 6000, num_bands);

os = zeros(1, N); % output signal

%TODO: Vectorize
for i=1:num_bands
    [bpf_bb,bpf_aa]=butter(3,[cutoffs(i) cutoffs(i+1)] ./ (Fs/2));
    
    band = filter(bpf_bb, bpf_aa, ss);% Get Band
        
    %Generate Envelope
    envelope = abs(band);
    envelope = filter(lpf_bb, lpf_aa, envelope); %TODO: should I half the frequency

    band = sin(pi .* (cutoffs(i) + cutoffs(i+1)) .* t );
    band = band .* envelope;
    
    band = filter(bpf_bb, bpf_aa, band);% pass band through BPF again
    
    os = os + band;
end

os = os ./ max(os); %normalize

end