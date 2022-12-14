

A = gallery('dramadah', 8);
B = eye(size(A, 1)); 
[Q R] = qr(A);
for i = 1 : n
  inv(:, i) = R \ (Q' * B(:, i));
endfor

inv