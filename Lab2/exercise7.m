% Youssef Beltagy
% BEE235A, Au 2021, Lab 2
% exercise7.m - Generating a Box

t=-10:0.1:10; 
boxsig = boxt(t,-3,3); 

plot(t,boxsig);
title("Box Signal from -3 to 3");
xlabel('Time (s)');
ylabel('Amplitude');