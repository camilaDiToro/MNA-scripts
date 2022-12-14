% Dado U triangular superior y b matriz
% resuelve el sistema: U * x = b 
% sin tener que invertir U 

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

U = [2 1 -1 1; 0 5/2 -3/2 -1/2; 0 0 14/5 -7/5; 0 0 0 7/2];
b = [5; -3/2; 14/5; 14];

U
b
x = upper_triang(U, b)