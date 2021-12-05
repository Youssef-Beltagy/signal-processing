function PlotSignals(t, ss, os, f, H, FT_ss, FT_os, description)

% Plot in time domain
layout = tiledlayout(2,1);
title(layout, "Time Domain Signals");

nexttile;
plot(t,ss);
title("Source Signal");
xlabel("Time / s")
ylabel("Amplitude")

nexttile;
plot(t,os);
title(sprintf("%s Signal", description));
xlabel("Time / s")
ylabel("Amplitude")

% Plot in Frequency Domain
figure();
layout = tiledlayout(3,1);
title(layout, "Frequency Domain Signals");

nexttile;
plot(f, abs(H));
title((sprintf("%s Frequency Response", description));
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

nexttile;
plot(f, abs(fftshift(FT_ss)));
title("Original Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

nexttile;
plot(f, abs(fftshift(FT_os)));
title("Filtered Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

end