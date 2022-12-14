% Dada una matriz A, calcula el producto de los elementos de su diagonal

1;
function [d] = PRODDIAGONAL(A)
    x = A(1, 1);
    n = length(A);
    for i=2:n
        x = x * A(i, i);
    endfor
    d = x 
endfunction


% Dado M calcular su determinante
format rat

s = 19
M = gallery('dramadah', s)

% 1) Primero vemos si los autovalores son complejos o no, si no lo son usamos PRODDIAGONAL(M)
eig(M) % vemos que no podemos usar M ya que devuelve numeros complejos

% 2) Descomponemos en valores singulares
[U S V] = svd(M)   

% 3) Multiplicamos los elementos de la matriz diagonal
d = PRODDIAGONAL(S) # si nos dejan, podemos usar prod(svd(M))