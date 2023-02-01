fid = fopen('denoise.dat', 'r');
m = textscan(fid, '%f %f');  
fclose(fid);
#m{1}=x ,  m{2}=y  
## construccion de la matriz D
D=[m{1} m{2}];
b=D(:,2);
X1=D(:,1);
n=size(X1)(1);
A=[ones(n) X1];
p=pinv(A)*b;
err = 0;
for i=1:size(X1)
  err = err + (b(i)-(p(1)+p(2)*X1(i)))^2;
endfor
err = err/n;

## Ahora lo mismo con D truncada a un solo valor singular
[U S V]=svd(D,'econ');
D = U(:,1)*S(1,1)*V(:,1)';
b=D(:,2);
X1=D(:,1);
n=size(X1)(1);
A=[ones(n) X1];
p=pinv(A)*b;
err = 0;
for i=1:size(X1)
  err = err + (b(i)-(p(1)+p(2)*X1(i)))^2;
endfor
err = err/n;
