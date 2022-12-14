% Construccion de las aproximaciones a la solucion del problema inicial
% y' = f(t, y) con y(a) = y_0 en [a, b]
function E=euler(f, a, b, ya, N)
  % Datos
  %   f:  funcion
  %   a:  extremo izquierdo del intervalo
  %   b:  extremo derecho del intervalo
  %   ya: condicion inicial, ie. y(a)
  %   N:  numero de pasos, ie N = (b-a)/h
  % Retorna
  %   E=[T' Y'] siendo T el vector de las abscisas, Y el vector de las ordenadas
  h=(b-a)/N;
  T=zeros(1, N+1);
  Y=zeros(1, N+1);
  T=a:h:b;
  Y(1)=ya;
  
  for j=1:N
    Y(j+1)=Y(j)+h*feval(f, T(j), Y(j));
  endfor
  E=[T' Y'];
endfunction