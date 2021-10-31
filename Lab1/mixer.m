function [out] = mixer(signal1, signal2)

if length(signal1) < length(signal2)
    signal1 = [signal1; zeros(length(signal2)-length(signal1), 1)];
elseif length(signal2) < length(signal1)
    signal2 = [signal2; zeros(length(signal1)-length(signal2), 1)];
end
    out = signal1 + signal2;
    out = out / max(abs(out));
end