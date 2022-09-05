function [A u]=HZERO1(A)
  x = A(:,1);
  colmax = max(abs(x));
  x=x/colmax;
  colnorm = sqrt(x'*x);
  u=x;
  if u(1) >= 0
    u(1) = u(1) + colnorm;
  else
    u(1) = u(1) - colnorm;
  endif
  % implicitly form HuA.
  unorm2 = u'*u;
  
  if unorm2 != 0
    hbeta = 2/unorm2;
  else
    hbeta = 0;
  endif
  A = A - hbeta*(u*u')*A;

endfunction