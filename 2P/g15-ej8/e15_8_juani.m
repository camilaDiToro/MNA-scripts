clear all; clc; close all;

alpha = 2^2; h = 0.1; y0 = 1; l = 0; r = 1;
N = ((r-l)/h)+1; % N es nodos totales
a = -(h^2)*(alpha^2) - 2;
b = [-y0; zeros(N-2, 1)];
md = ones(N-1, 1) * a; % main diagonal
ld = [ones(N-3, 1); 2]; % lower diagonal
ud = ones(N-2, 1); % upper diagonal
A = diag(md) + diag(ld, -1) + diag(ud, 1);
inter = (l:h:r)';

tic();
A = sparse(A);
res = A\b;
res = [y0; res];
toc();
cont = (l:0.001:r)';
exact = cosh(alpha*(1-cont))/cosh(alpha);

hold on;
plot(inter, res, 'rx', 'linewidth', 4);
plot(cont, exact, 'linewidth', 4);
legend('Approximation', 'Exact');
hold off;
