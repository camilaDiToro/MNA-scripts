####OBTENER LA PSEUDO INVERSA MEDIANTE SVD
A=[ 1 2; 3 4; 5 6];
[U S V]=svd(A,'econ');
n=size(S)(1);
Sp=zeros(n,n);
for i = 1:n
  Sp(i,i) = 1/S(i,i);
endfor
Apinv=V*Sp*U';