function [out] = repeat(in, N, silence)

out = [];

for i=1:N
    
    out = [out; in; silence];
    
end;