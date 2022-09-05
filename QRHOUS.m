function [Q R]=QRHOUS(A)
  [m n]=size(A);
  R=A;
  Q=eye(m);
  k = min(m-1, n);
  for i = 1:k
    [R(i:m,i:n) , u ]= HZERO1(R (i:m, i:n));
    Q (1:m,i:m) = Q(1:m,i:m)-(2/ (u'*u))*Q(1:m, i:m)*(u*u');
  endfor
endfunction