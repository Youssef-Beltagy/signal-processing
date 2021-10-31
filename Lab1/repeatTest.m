load fall
layout = tiledlayout(3,1);
title(layout, "Repeater");

nexttile
plot(fall);
title("original");
ylabel("signal");
xlabel ("time");

nexttile
plot(repeat(fall,3,[]))
title("repeated")
ylabel("signal");
xlabel ("time");

nexttile
plot(repeat(fall,3,zeros(50000 - length(fall),1)))
title("repeated with space")
ylabel("signal");
xlabel ("time");

