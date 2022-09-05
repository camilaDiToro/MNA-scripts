function X=PLUSOLVE(L,U,P,B)
  [m n]=size(B);
  pb = P*B;
  X=zeros(size(B));
  for i = 1:n
    yi = FSUB(L, pb (:, i));
    xi = BSUB (U, yi);
    X (:, i) = xi;
  endfor
endfunction