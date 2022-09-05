function x = FSUB (A, b)
  [m,n]=size(A);
  x=zeros(m,1);
  x(1) = b(1)/A(1,1);
  for i = 2:1:m
    x(i) = (b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
  endfor
endfunction