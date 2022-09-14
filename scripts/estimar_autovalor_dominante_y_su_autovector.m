format long


A = [1 -1 0; 2 4 -2; 0 -1 1]
x0 = [1; -0.5; 1]
[v, lambda, niter] = apower(A, v0=x0, tol=1e-10, max_iter=1000)

[P D] = eig(A)