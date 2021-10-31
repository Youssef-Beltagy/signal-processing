function [out] = delay(signal, Fs, td)

offset = fix(Fs * td);

if offset == 0
    out = signal;
elseif offset > 0 && offset < length(signal)
    out = [
        zeros(offset,1) ;
        signal(1:(length(signal) - offset))
        ];
    
elseif offset < 0 && offset > (-length(signal))
    offset = -offset;
    out = [
        signal((offset + 1):length(signal));
        zeros(offset,1) 
        ];
else
    out = zeros(size(signal));  
end

end
