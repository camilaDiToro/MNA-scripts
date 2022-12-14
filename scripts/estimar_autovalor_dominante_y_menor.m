format long

A = [1 -1 0; 2 4 -2; 0 -1 1]
v0 = [1; -0.5; 1]

printf("\n\n\n\n")
printf("Calculo el autovalor dominante")
printf("\n\n\n\n")

[v, lambda, niter] = APOWER(A, v0, tol=1e-10, max_iter=1000)
%[P D] = eig(A)


printf("\n\n\n\n")
printf("Calculo el menor (en modulo) autovalor")
printf("\n\n\n\n")
[v, lambda, niter] = ISPOWER(A, v0, tol=1e-5, max_iter=1000)

% printf("\n\n\n\n")
% printf("Calculo el autovalor dominante con diferentes condiciones iniciales")
% printf("\n\n\n\n")

% for i=1:50
%     x0 = 2^(i)*[1; -3; 1] + [1; 0; 1];
%     [v, lambda, niter] = APOWER(A, x0, tol=1e-10, max_iter=1000)
% endfor
