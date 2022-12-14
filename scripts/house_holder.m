format rat; 
n=2

V=R1(n:end,n:end)

V =
10/3
-4
10/3
0
-5/3
-2

m=size(V,1)

m = 3

x=V(:,1);

nx=norm(x);

s=sign(V(1,1))*nx;
%extrae submatriz
%calcula numero de filas de la sub
%extrae primer columnas
%calcula su norma
%determina s