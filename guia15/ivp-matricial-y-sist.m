%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve por IVP matricial y con for
%          y' = -(alpha^2)*y
%          en el intervalo [xmin;xmax]
%    con las condiciones de borde y(0)=1
%    se  utiliza un esquema explicito; con N puntos totales.
%
%
%
%    Queda un:
%       y_(k+1) = (1-alpha^2 *h) * yk
%       
%    Que lo optimizo por:
%     
%       y_(k+1) = (1-alpha^2 *h)^(k+1) * y0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clf; close all;

N      = 100;         # cantidad de puntos
e      = [0:1:N-1]';  
h      = 0.1;
alpha2 = 1;            # CTE alpha^2 = 1

d = 1-alpha2*h        # valor de la diferencia finita

y0=1;
yn=zeros(N,1);
yn(1)=y0;
x=[0:1:N-1]'*h;

# Resuelvo con la forma lenta (ie. el for)
t0=tic();
for i=2:N
  yn(i)=d*yn(i-1);
endfor
toc(t0);

ye=exp(-alpha2*x);

# Resuelvo usando version vectorizada
t0=tic();
  ynf=y0*d.^e;
toc(t0);

# Calculo los errores y ploteo
errl = norm((ye-yn) , 'inf')
errf = norm((ye-ynf), 'inf')
plot(x,ye,'-k',x,yn,'ob',x,ynf,'*r')