% format rat

function [Q R] = QR2X2(A)
    q1n = (1/sqrt(A(1, 1)^2+A(2, 1)^2))*A(1,:)';
    q2 = A(2,:)' - (q1n(1)*A(1, 2)+q1n(2)*A(2, 2))*q1n;
    q2n = (1/sqrt(q2(1)^2+q2(2)^2))*q2;
    Q = [q1n q2n];
    R = Q'*A;
endfunction