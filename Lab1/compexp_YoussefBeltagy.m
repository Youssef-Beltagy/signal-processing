%Youssef Beltagy
%EE235 Autumn 2021, lab 1
%compexp_YoussefBeltagy.m
% produces three 3D plots of decaying complex exponential,
% with subplots of magnitude and phase and of real and imaginary
% components below it.

% Set the time
t = 0:0.01:5;

% Original Graph
y=3*exp(-(0.25+j*(2*pi))*t);
plot3dgraph('3-D plot of a Complex Exponential (original)',t,y)

% Doubled Frequency Graph
figure();
y=3*exp(-(0.25+j*(4*pi))*t); % double the frequency
plot3dgraph('3-D plot of a Complex Exponential (double frequency)',t,y)


% Faster Decay Graph
figure();
y=3*exp(-(1+j*(2*pi))*t); % Faster Decay
plot3dgraph('3-D plot of a Complex Exponential (faster decay)',t,y)


% Plots the 3d graph
function plot3dgraph(name, t, y)

    subplot(3,1,1);
    plot3(t,real(y),imag(y));
    grid
    xlabel('t'),ylabel('Re(y)'),zlabel('Im(y)');
    title(name);

    %produce magnitude and phase plots; t vs |y(t)| and t vs. <y(t).

    subplot(3,2,3),plot(t,abs(y)),xlabel('t'),
    ylabel('Magnitude'),title('Magnitude - |y(t)|');

    subplot(3,2,4),plot(t,angle(y)),xlabel('t'),
    ylabel('Angle'),title('Phase - Arg(y(t))');

    %produce real and imag plots; t vs |y(t)| and t vs. <y(t).

    subplot(3,2,5),plot(t,real(y)),xlabel('t'),
    ylabel('Magnitude'),title('Re(y(t))');

    subplot(3,2,6),plot(t,imag(y)),xlabel('t'),
    ylabel('Angle'),title('Im(y(t))');

end
