M = [2 4 2 0; 4 -10 2 0; 1 2 4 1;1 1 1 1;];
b = [ 16; -10; 21; 10];
[L U P] = lu(M);
multiplicacion = P*b;
z = L \ multiplicacion;
x = U \ z