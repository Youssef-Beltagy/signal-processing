"Sine Vocoder Demo"

% Runs the vocoder on the first sentence using 8 bands and 
% a sine carrier wave.
vocode_run(1,"both",8,"sine");

"White Noise Vocoder Demo"

% Runs the vocoder on the first sentence using 8 bands and 
% a white noise carrier wave.
vocode_run(1,"both",8,"noise");

"Chimera without Swapping Demo"

% Runs the chimera function with the first and second sentences
% using 8 bands and without swapping the TCF/ENV between 
% the two signals for different bands.
chimera_run(1,2,"both",8,"no-swap");

"Chimera with Swapping Demo"

% Runs the chimera function with the first and second sentences
% using 8 bands and swaps the TCF/ENV between the two signals 
% for different bands.
chimera_run(1,2,"both",8,"swap");