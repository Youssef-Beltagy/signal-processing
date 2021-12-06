% Youssef Beltagy
% BEE235A, Aut 2021, Lab 4
% PlotSignals - plots time and frequency signals

function PlotSignals(t, ss, os, f, H, FT_ss, FT_os, description)

% Plot in time domain
layout = tiledlayout(2,1);
title(layout, "Time Domain Signals");

nexttile;
plot(t,ss);
title("Source Signal");
xlabel("Time / s")
ylabel("Amplitude")
ylim([-1 1])

nexttile;
plot(t,os);
title(sprintf("%s Signal", description));
xlabel("Time / s")
ylabel("Amplitude")
ylim([-1 1])

% Plot in Frequency Domain
figure();
layout = tiledlayout(3,1);
title(layout, "Frequency Domain Signals");

nexttile;
plot(f, abs(H));
title(sprintf("%s Frequency Response", description));
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");

nexttile;
plot(f, abs(fftshift(FT_ss)));
title("Original Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");
ylim([0 1500])

nexttile;
plot(f, abs(fftshift(FT_os)));
title("Filtered Signal");
xlabel("Frequency / Hz");
ylabel("|H(j\omega)|");
ylim([0 1500])

end