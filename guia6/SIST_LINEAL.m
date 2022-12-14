% Resolver sistemas de ecuaciones lineales del tipo
% A * x = b
% Factorizando A en L y U para utilizar UPPER_TRIANG
% y LOWER_TRIANG 

format long

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


% Con factorizacion QR:
% Ax = QRx = b
% Resolvemos: 
% 1) z = Q' * b 
% 2) R * x = z // uso lower_triang

printf("Factorizacion QR")
printf("\n")

A = [2 1 -1 1; -1 2 -1 -1; 1 1 2 -1; -1 1 1 2]
b = [5; -4; 5; 12]

[Q R] = qr(A)
z = Q'*b
x = lower_triang(R, z)

% Con factorizacion LU:
% Ax = LUx = Pb
% Resolvemos:
% 1) L * z = P * b  // uso upper_triang
% 2) U * x = z      // uso lower_triang

printf("Factorizacion LU")
printf("\n")

A = [0 0 4; 1 3 2; 2 8 4]
b = [-8; 1; 6]

[L U P] = lu(A)
z = upper_triang(L, P*b)
x = lower_triang(U, z)