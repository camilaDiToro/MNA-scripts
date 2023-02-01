function [v, lambda, niter] = APOWER(A, v0, tol, max_iter)
  k = 0;
  v_old = v0/norm(v0);
  lambda_old=v_old'*A*v_old;
  do
    v_new = A * v_old;
    v_new=v_new/norm(v_new);
    lambda_new = (v_new' *A* v_new);
    v_old = v_new;
    lambda_old=lambda_new;
    err=norm(A*v_old - lambda_old*v_old);
    k += 1;
  until err < tol | (k>max_iter)
  niter=k-1;
  v = v_new ;
  lambda=lambda_new;
  if (k > max_iter)
    disp("Error: el método no converge");
    v = [];
    lambda = [];
  endif
endfunction