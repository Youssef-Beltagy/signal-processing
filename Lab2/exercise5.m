% Exercise 5
load fall

fall = fall'; % convert fall into a row vector
h2 =[ones(1,50)/20 zeros(1,20)];
y2 = conv(fall, h2);

%plotting
layout = tiledlayout(3,1);
title(layout, "Exercise 5");

nexttile
plot([h2 zeros(1, length(y2) - length(h2))]);
title("h(t)");
ylabel("amplitude");
xlabel ("time");

nexttile
plot([fall zeros(1, length(y2) - length(fall))])
title("fall")
ylabel("amplitude");
xlabel ("time");

nexttile
plot(y2)
title("conv(fall,h)")
ylabel("amplitude");
xlabel ("time");

% Play the sounds 
sound(fall);
pause(4);
sound(y2); %muffled weaker sound