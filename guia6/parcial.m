% Con factorizacion LU:
% Ax = LUx = Pb
% Resolvemos:
% 1) L * z = P * b  // uso upper_triang
% 2) U * x = z      // uso lower_triang

format rat

function x = upper_triang(U, b)
    x = zeros(columns(U), 1);
    n = rows(U);

    x(n) = b(n)/U(n, n);

    for idx=n-1:-1:1
        s = 0.0;
        for jota=idx+1:n 
            s = s + U(idx, jota)*x(jota);
        endfor
        x(idx) = (b(idx) - s)/U(idx, idx);
    endfor 

    % return x
endfunction

function x = lower_triang(L, b)
    x = zeros(columns(L), 1);
    n = rows(L);

    x(1) = b(1)/L(1, 1);

    for idx=2:n 
        s = 0.0;
        for jota=1:idx-1
            s=s+L(idx, jota)*x(jota);
        endfor
        x(idx) = (b(idx) - s)/L(idx, idx);
    endfor

    % return x
endfunction

printf("Factorizacion LU")
printf("\n")

A = [2 4 2 0; 4 -10 2 0; 1 2 4 1; 1 1 1 1]
b = [16; -10; 21; 10]

[L U P] = lu(A)
z = upper_triang(L, P*b)
x = lower_triang(U, z)




1;
function Ainv = test(A)
  n = size(A, 1); # cant filas/cols
  B = eye(n); # identidad
  [Q R] = qr(A);
  for i = 1 : n
    # Rx=Q'b
    Ainv(:, i) = R \ (Q' * B(:, i)); # '\' resuelve sustitucion hacia atras
  endfor
end