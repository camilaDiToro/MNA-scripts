#### Podemos resolver un sistema de ecuaciones sobredimensionado 
#### utilizando la inversa
A=[3.25 1; 2.55 1; 1.4 1];
b= [ 3 2 1]';
p=pinv(A)*b


#### O bien con el metodo QR
qr[Q R]=qr(A);
p=linsolve(R,Q’*b)