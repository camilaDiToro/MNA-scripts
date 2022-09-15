% Metodo de las potencias aplicado a matrices inversas
%
% Dado: 
% 1) matriz A 
% 2) matriz seed v0
% 3) una tolerancia (tol=1e-10)
% 4) una cantidad maxima de iteraciones (max_iter=1000)
%
% Retorna:
% 1) el autovector v correspondiente al lambda
% 2) el autovalor dominante lambda
% 3) la cantidad de itereraciones

function [v, lambda, niter] = ISPOWER(A, v0, s, tol, max_iter)
  k = 0;
  [m n]=size(A);
  if (m~=n), error('La matriz a procesar debe ser cuadrada'), end
  switch (nargin)
    case 1;    v0=ones(m,1); max_iter=100; s=0; tol=1e-6;
    case 2;    max_iter=100; s=0; tol=1e-6;
    case 3;    tol=1e-6; max_iter=100;
    case 4;    max_iter=100;
  endswitch
  
  [L U P]=PLUD(A-s*eye(n));
  v0=v0/norm(v0);
  v_old = PLUSOLVE(L,U,P,v0);
  v_old=v_old/norm(v_old);
  mu_old=v0'*v_old;
  do
    v_new = PLUSOLVE(L,U,P,v_old);
    mu_new = v_old'*v_new;
    v_new=v_new/norm(v_new);
    errv=norm(v_old - v_new);
    errl=abs(mu_old-mu_new);
    v_old = v_new;
    mu_old=mu_new;
    k += 1;
  until (errv <tol) | (errl< abs(mu_old)*tol)|(k>max_iter)
  niter=k-1;
  v = v_new ;
  lambda=s+1/mu_new;
    if (k > max_iter)
    disp("Error: el método no converge");
    v = [];
    lambda = [];
  endif
endfunction