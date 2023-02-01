function a=FINDQRAVAL(A, tol, max_iter)
  if (nargin==1)
     tol=1e-6; max_iter =10000;
  endif
  err=inf;
  k=0;
  dold=zeros(length(A),1);
  while (err>tol) && (k<max_iter)
    [Q R]=qr(A);
    A=R*Q;
    dnew=diag(A);
    err=max(abs(dnew-dold));
    dold=dnew;
    k+=1;
  endwhile
  if (k>max_iter)
    disp('No converge');
  else
    a=diag(A);
    fprintf('Número de iteraciones=%d \n' ,k-1)
  endif
endfunction