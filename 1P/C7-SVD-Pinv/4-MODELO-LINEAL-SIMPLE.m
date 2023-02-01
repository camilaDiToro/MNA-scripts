## MODELO LINEAL SIMPLE

D=[1 45; 2 50; 3 60; 4 80; 5 110 ; 6 150; 7 200; 8 300; 9 500 ; 10 1000];
b=D(:,2); X=D(:,1);
n=4; ## grado del polinomio
A=zeros(size(D)(1),n+1)
for i = 0:n
  A(:,i+1)=X.^i;
endfor
p=pinv(A)*b