% Generates Frequency Cutoffs for the bands

function fco=bands_cutoff(fmin, fmax, N); 

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