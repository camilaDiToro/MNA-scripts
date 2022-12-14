

% Con factorizacion QR:
% Ax = QRx = b
% Resolvemos: 
% 1) z = Q' * b 
% 2) R * x = z // uso lower_triang

printf("Factorizacion QR")
printf("\n")

A = gallery('dramadah', 8);
b = eye(rank(A))

[Q R] = qr(A)
z = Q'*b
x = lower_triang(R, z)