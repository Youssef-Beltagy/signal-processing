function os = vocode(ss, Fs, num_bands, fmin, fmax)
   arguments
        ss(:,:);
        Fs(1,1);
        num_bands(1,1) = 8;
        fmin(1,1) = 300;
        fmax(1,1) = 6000;
   end

SIZE = size(ss);

if SIZE(1) > 1
    ss = ss';
end

N = length(ss);
t = ( 0:(N - 1) ) ./ Fs;

[lpf_bb,lpf_aa]=butter(2,400/(Fs/2));

cutoffs = bands_cutoff(fmin, fmax, num_bands);

os = zeros(1, N); % output signal

%TODO: Vectorize
for i=1:num_bands
    [bpf_bb,bpf_aa]=butter(3,[cutoffs(i) cutoffs(i+1)] ./ (Fs/2));
    
    band = filter(bpf_bb, bpf_aa, ss);% Get Band
    
    %TODO: Delete me later
    frequency_band = band;
    
    %Generate Envelope
    envelope = abs(band);
    envelope = filter(lpf_bb, lpf_aa, envelope); %TODO: should I half the frequency

    band = sin(pi .* (cutoffs(i) + cutoffs(i+1)) .* t );
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

% Generates Frequency Cutoffs for the bands
function fco=bands_cutoff(fmin, fmax, N)

  % TODO: This "relative value" logarithmic seems
  % meaningless to me.
  % Investigate and possibly eliminate later.
  xmin = log10(fmin/165.4+1)/2.1;
  xmax = log10(fmax/165.4+1)/2.1;    %relative value

  dx = (xmax-xmin)/N;
  
  x = xmin:dx:xmax;
  
  fco=zeros(1,N+1); 
  
for i=1:N+1

fco(i)=165.4*(10^(x(i)*2.1)-1);

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