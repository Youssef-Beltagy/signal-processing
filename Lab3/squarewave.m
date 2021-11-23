% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% squarewave.m - Generates a Fourier Series approximation of a square Wave
% given the maximum number of coefficients.
% t is the input time (must be a row vector)
% max_k is the maximum number of coefficients
% This function was vectorized for efficiency.


function x=squarewave(t, max_k)

k = 0:1:max_k; % The coefficient indices
C_k = Ck(k); % The coefficient values
w_0 = pi / 3; % Angular Frequency

x = (k' * t) .* w_0; % Genrate a KxT matrix
x = x + repmat(angle(C_k'), 1, length(t)); % add angle of C_k to every column
x = cos(x); % Get the cosine of every element 
x = x .* repmat(abs(C_k'), 1, length(t)); % bitwise multipilication of every column by C_k
x = sum(x, 1); % Squash the columns
x = 2 .* x; % multiply every value of x by 2

end