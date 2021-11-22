% Youssef Beltagy
% BEE235A, Aut 2021, Lab 3
% squarewave.m - Generates a Fourier Series approximation of a square Wave
% given the maximum number of coefficients.

function x=squarewave(t, max_k)

k = 0:1:max_k;
C_k = Ck(k);
w_0 = pi / 3;

x = zeros(size(t));

% TODO: consider vectorizing
% O(t * max_k)
for i=1:length(t)
    x(i) = sum(2 .* abs(C_k) .* cos(k * w_0 * t(i) + angle(C_k)) );
end

end