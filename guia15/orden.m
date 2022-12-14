%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Métodos Numéricos Avanzados                               %
%                             2C 2021                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Este script evalúa la diferrencia entre la derivada obtenida por MDF y la %
%    exacta, en función del tamaño del paso de discretización.                 %
%                                                                              % 
%    Se evalúa un esquema progresivo (Fordward) , regresivo (Backward)         %
%    y centrado.                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc

# Funcion a calcular su derivada
function y = Fun(x)
  y = exp(-x).*sin(3*x); 
endfunction  

# La derivada analitica de la funcion Fun
function y = dFun(x)
  y = -exp(-x).*sin(3*x)+ 3*exp(-x).*cos(3*x); 
endfunction  

xmax=4;
Ni=35;  % Nodos Internos

x = linspace(0, xmax, Ni+1);   # Genera n puntos equispaciados en el intervalo [xmax, Ni+1] 
F = Fun(x); 
h = x(2) - x(1);               # Defino el paso

# Metodo de las Diferencias Centradas
xCentral   = x(2:end-1);
dFCenteral = (F(3:end) - F(1:end-2))  / (2*h); # (f(n+1) - f(n-1))/2

# Metodo de las Diferencias Progresivas
xForward   = x(1:end-1);
dFForward  = (F(2:end)  - F(1:end-1)) / h;

# Metodo de las Diferencias Regresivas
xBackward  = x(2:end);
dFBackward = (F(2:end) - F(1:end-1))  / h;

# Metodo de las Diferencias de N puntos
# Aca pongo los valores de alpha, beta, gamma, etc.. pero sin el h!
a = -1/3;
b = -1/2;
c = 1;
d = -1/6;

xNPoints  = x(2:end-2); # a*f(n-1) + b*f(n) + c*f(n+1) + d*f(n+2)
dFNPoints = (a*F(1:end-3)+ b*F(2:end-2) + c*F(3:end-1) + d*F(4:end))/h; # Aca pongo la aprox a la derivada que obtuve en el ejercicio

# Start Plot
plot(x, dFun(x));
hold on
plot(xCentral ,  dFCenteral ,  'r');
plot(xForward ,  dFForward  ,  'k');
plot(xBackward,  dFBackward ,  'g');
plot(xNPoints ,  dFNPoints  ,  'b');
legend('Analytic',  'Centred',  'Forward',  'Backward')
hold off;
# End Plot




###### Empiezo grafico para el Plot del Error

# Aproxima la derivada para un x0 dado, para diferentes pasos.
x0       = 2;
dh       = 2*xmax / Ni;
F0       = Fun(x0);
dF0      = dFun(x0);
Fordward = [];
Backward = [];
Centred  = [];
NPoints  = [];
hh       = 2*dh;
h        = [];

fprintf('      h,       Analitica   ,    Fordward   ,   Backward   ,    Centred\n')

for i=1:Ni;
    hh = hh / 2; # Pruebo la aproximacion para distintos pasos
    
    # Defino numeradores de las aproximaciones
    fw = ( Fun(x0 + hh) - F0           ); # progresiva
    fb = ( F0           - Fun(x0 - hh) ); # regresiva
    fc = ( Fun(x0 + hh) - Fun(x0 - hh) ); # centrada
    fp = (a * Fun(x0-hh) + b * F0 + c * Fun(x0+hh) + d * Fun(x0+2*hh) )
    # Defino el error tomando numeradores de arriba y sus denominadores
    # Comparando contra la derivada exacta
    Fordward = [Fordward abs((fw/hh     - dF0))]; # progresiva
    Backward = [Backward abs((fb/hh     - dF0))]; # regresiva
    Centred  = [Centred abs((fc/(2*hh)  - dF0))]; # centrada
    
    NPoints  = [NPoints abs(fp/hh-dF0)];
    
    h = [h hh];
    fprintf(
      ' %1.6e, %1.6e, %1.6e, %1.6e, %1.6e\n',
      hh, 
      dF0,
      abs((fw / hh - dF0)     / dF0),
      abs((fb / hh - dF0)     / dF0), 
      abs((fc / (2*hh) - dF0) / dF0)
    )
endfor

figure 2, loglog(h, Fordward, '-r',h,  Backward, '-g', h, Centred, '-b',h,NPoints, '-c');
legend('Forward','Backward', 'Centred', 'N Points')