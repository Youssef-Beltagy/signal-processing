t=-10:0.1:10; 
boxsig = boxt(t,-3,3); 

plot(t,boxsig);
title("Box Signal from -3 to 3");
ylabel("amplitude");
xlabel("time");