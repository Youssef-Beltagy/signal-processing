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
    
    %TODO: Delete me later
    frequency_band = band;
    
    %Generate Envelope
    envelope = abs(band);
    envelope = filter(lpf_bb, lpf_aa, envelope);
    
    band = generate_carrier(mode, cutoffs(i), cutoffs(i + 1), bpf_bb, bpf_aa, t);
    band = band .* envelope;
    
    band = filter(bpf_bb, bpf_aa, band);% pass band through BPF again
    
    %TODO: delete me later
    %plot_fft(ss, Fs, bpf_bb, bpf_aa, frequency_band, envelope, band, cutoffs(i), cutoffs(i+1));
        
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

%Plots intermediary results
function plot_fft(ss,Fs,bb,aa,band_ss, envelope, result, fmin, fmax)

N = length(ss);
f = ((-N/2+1):(N/2)) .* (Fs / N);
t = (0:(N-1)) ./ Fs;

% plot
figure();
layout = tiledlayout(5,1);
title(layout, sprintf("BPF for %d - %d", round(fmin), round(fmax)));

nexttile
FT_ss = fftshift(fft(ss));
plot(f,abs(FT_ss));
title("original signal");
ylabel("Amplitude");
xlabel("Frequency / Hz");
xlim([0 5000]);
ylim([0,200]);


nexttile
[H,F]=freqz(bb,aa,256,Fs); 
plot(F,abs(H));
title("BPF Filter");
ylabel("Amplitude");
xlabel("Frequency / Hz");
xlim([0 5000]);
ylim([0,1]);

nexttile
FT_band_ss = fftshift(fft(band_ss));
plot(f,abs(FT_band_ss));
title("Frequency Band (BPF result)");
ylabel("Amplitude");
xlabel("Frequency / Hz");
xlim([0 5000]);
ylim([0,200]);

nexttile;
plot(t,envelope);
title("Envelope of Band");
ylabel("Amplitude");
xlabel("Time / s");
xlim([0.2 1]);
ylim([-0.1 0.1]);

nexttile;
plot(t,result);
title("Band");
ylabel("Amplitude");
xlabel("Time / s");
xlim([0.2 1]);
ylim([-0.1 0.1]);


end