% Write down a Matlab function function [F] = EightPointsAlgorithm(P1, P2) implementing the following steps:
% Write down the matrix A (see the slides...)
% Compute the SVD decomposition of A 
% [U, D, V]=svd(A);
% and select as solution f the last column of V.
% Reshape the column vector f so to obtain a matrix F (see function reshape)
% Force the rank of F to be 2:
% Use again the SVD to decompose the matrix 
% [U, D, V] = svd(F)
% Set D(3,3)=0
% Recompute the final F: F=U*D*VT.

function[F] = EightPointsAlgorithm(P1, P2)
%     fprintf("hui");
    P1 = transpose([P1(1: 8, :), ones(8, 1)]);
    P2 = transpose([P2(1: 8, :), ones(8, 1)]);
    P1 = transpose(P1 ./ repmat(P1(3, :), [3, 1]));
    P2 = transpose(P2 ./ repmat(P2(3, :), [3, 1]));
    x1 = P1(:, 1);
    y1 = P1(:, 2);
    x2 = P2(:, 1);
    y2 = P2(:, 2);
    A = [x2 .* x1, x2 .* y1, x2, y2 .* x1, y2 .* y1, y2, x1, y1, ones(8,1)];
    [U, D, V] = svd(A);
    F_reshaped = [V(1, 9), V(2, 9), V(3, 9); V(4, 9), V(5, 9), V(6, 9); V(7, 9), V(8, 9), V(9, 9)];
    [U, D, V] = svd(F_reshaped);
    D(3,3) = 0;
    F = U * D * transpose(V);
end





