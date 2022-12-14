%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve por un esquema de segundo orden la ecuación
%          y''=xy
%          en el intervalo [xmin;xmax]
%    con las condiciones de borde y(0)=1; y(infinito)=0   (CONDICIONES DE DIRICHLET!)
%    se  utiliza un esquema centrado de segundo orden; con NI puntos interiores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc
xmin=0;
xmax=1;
ymin=0.35503;		% y(0)=1
ymax=0; 	      % y(infinito)=0
NI=4;           % nodos internos
h=(xmax-xmin)/(NI+1) % calculo el paso
x=linspace(xmin, xmax, NI+2)'; # 4 nodos interiores ... voy de 0 a 5 -> NI+2=6 nodos en total

% Armo la matriz
dp1=ones(NI-1,1);
d0=-(2+h^2*x(2:end-1));  # La diagonal es de la forma: -(2 + k * (h^3)) = -(2 + x_k * h^2)
M=diag(d0) + diag(dp1,1) + diag(dp1,-1); % diag(d,1) es la supradiag (i.e rm_k), diag(d, -1) es la infradiag (ie rp_k)

# Planteo como queda la matrix b, b = [-y_0 0 0 -y_max]
b=zeros(NI,1);
b(1)=-ymin;
b(end)=-ymax;

ysimi=inv(M)*b % puntos intermedios 
ysim=[ymin; ysimi;  ymax];

yex=airy(0, x); % sn exacta 

plot(x, ysim, '*', x , yex,'-r')
legend('Aprox', 'Exacta')