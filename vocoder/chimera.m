% Youssef Beltagy
% BEE235A, Aut 2021, Vocoder Project
% chimera.m - The chimera function
%arguments
%        input_sig1(:,:); % first input signal
%        input_Fs1(1,1); % sampling frequency of first input signal
%        input_sig2(:,:); % second input signal
%        input_Fs2(1,1); % sampling frequency of second input signal
%        num_bands(1,1) = 8; % number of bands to use
%        mode(1,1) = "no-swap"; % specifies whether to flip between the 
%        two signals or not. mode: swap, no-swap
%        fmin(1,1) = 300; % minimum frequency to use in bands
%        fmax(1,1) = 6000; % maximum frequency to use in bands

function [os, Fs] = chimera(input_sig1, input_Fs1, input_sig2, ...
                            input_Fs2, num_bands, mode, fmin, fmax)
    arguments
        input_sig1(:,:); % first input signal
        input_Fs1(1,1); % sampling frequency of first input signal
        input_sig2(:,:); % seconds input signal
        input_Fs2(1,1); % sampling frequency of second input signal
        num_bands(1,1) = 8; % number of bands to use
        mode(1,1) = "no-swap"; % specifies whether to flip between the two signals or not.
        % mode: swap, no-swap
        fmin(1,1) = 300; % minimum frequency to use in bands
        fmax(1,1) = 6000; % maximum frequency to use in bands
   end

[sig1, sig2, Fs, N] = ... 
normalize_sampling_and_length(input_sig1, input_Fs1, ... 
                                input_sig2, input_Fs2);

cutoffs = bands_cutoff(fmin, fmax, num_bands);

os = zeros(1, N); % output signal

for i=1:num_bands
    % band pass filter
    [bpf_bb,bpf_aa] = butter(3,[cutoffs(i) cutoffs(i+1)] ./ (Fs/2));
    
    % envelope and carrier for first signal
    sig1_band = filter(bpf_bb, bpf_aa, sig1);
    [sig1_env, sig1_tfs] = get_env_tfs(sig1_band);
    
    % envelope and carrier for second signal
    sig2_band = filter(bpf_bb, bpf_aa, sig2);%
    [sig2_env, sig2_tfs] = get_env_tfs(sig2_band);
    
    % if the mode is swapping, swap carrier and envelope every band.
    % if not, just use the envelope of the first signal and the carrier of
    % the second signal.
    if(strcmp(mode,"swap"))
        if(mod(i,2) == 1)
            os = os + sig1_env .* sig2_tfs;
        else
            os = os + sig2_env .* sig1_tfs;
        end
    else
        os = os + sig1_env .* sig2_tfs;
    end
end

os = os ./ max(abs(os)); %normalize

end

function [os_1, os_2, Fs, N] = normalize_sampling_and_length(ss1, Fs1, ss2, Fs2)

% normalize to the lower frequency
if Fs1 > Fs2
   Fs = Fs2;
   os_1 = resample(ss1, Fs2, Fs1);
   os_2 = ss2;
elseif Fs2 > Fs1
    Fs = Fs1;
    os_1 = ss1;
    os_2 = resample(ss2,Fs1,Fs2);
else
    Fs = Fs1;
    os_1 = ss1;
    os_2 = ss2;
end

% convert to row vectors
temp = size(os_1);

if(temp(1) > 1)
    os_1 = os_1';
end

temp = size(os_2);

if(temp(1) > 1)
    os_2 = os_2';
end

% normalize the vector sizes.
N = length(os_1);
N2 = length(os_2);
if N2 < N
    N = N2;
end

os_1 = os_1(:,1:N);
os_2 = os_2(:,1:N);

end

function [env,tfs] = get_env_tfs(ss)
temp = hilbert(ss); % x: vector of an audio signal. To form an analytical signal (complex)

env = abs(temp); % envelope extraction ENV 
inst_phase = unwrap(angle(temp)); % instantaneous phase

%Regenerate the carrier from the instantaneous phase 
tfs = cos(inst_phase); % temporal fine structure TFS
end