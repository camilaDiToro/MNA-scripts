function [Q,R]=QRMOGRSCH(A)
  [m n]=size(A);
  Q=zeros(size(A));
  for i = 1:n
    Q(:, i) = A(:, i);
    for j = 1:i-1
      R(j, i) = Q(:,j)' * Q(:,i);
      Q(:, i) = Q(:,i) -R(j,i)*Q(:,j);
     endfor
     R(i, i) = sqrt(Q(:, i)'*Q(:, i));
     Q(:, i) = Q(:,i)/R(i,i);
    endfor
endfunction