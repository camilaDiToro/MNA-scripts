function [L U P s] = PLUD (A)
  [n m]=size(A);
  s=1;
  L=eye(n);
  P=L;
  for i = 1:n-1
    [~,r] = max(abs(A(i:n,i)))
    pivotindex = i + r -1;
    if (pivotindex ~= i)
      s=-s;
      A([i pivotindex],1:m) =A([pivotindex i],1:m);
      % Swap whole rows in P.
      P([i pivotindex],1:n) = P([pivotindex i],1:n);
      L([i pivotindex],1:i-1) = L([pivotindex i],1:i-1);
    endif
    % Compute the multipliers.
    multipliers = A(i+1:n,i)/A(i,i);
    % Use submatrix calculations instead of a loop to perform
    % the row operations on the submatrix A(i+1:n, i+1:n)
     A(i+1:n,1:m) = A(i+1:n,1:m) - multipliers*A(i,1:m);
     % Set entries in column i, rows i+1:n to 0.
     L(i+1:n,i) = multipliers;
   endfor
   U = A ;
endfunction