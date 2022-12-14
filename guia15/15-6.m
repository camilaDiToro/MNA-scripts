%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve la ecuación
%          y''+by'+w^2*y=0
%          en el intervalo [xmin;xmax]
%    con las condicion inicial y(xmin)=1,  y'(xmin)=0; 
%    se usa una aproximacion progresiva de la derivada 
%    con NI puntos interiores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


#############################
# Planteo:
# 1) u = y'
# 2) u' = y''
#
# Remplazo en la EDO (1) y (2): 
#   u' + b u + w^2*y=0
#
# Planteo el sistema matricial:
#
# [y' u']' = [0 1; -w^2 -b]' * [y u]'    con y_0 =1, u_0 =0
#
# Si tuviese un g(t) en vez de un 0 como esta EDO, al sistema matricial le agrego
#
# [y' u']' = [0 1; -w^2 -b]' * [y u]' + [0 1]' * g(t)    con y_0 = 1, u_0 = 0
#############################
clear all ; close all; clc
xmin=0;
xmax=2*pi;
ymin=[1;0]; % Condiciones iniciales y_0 = 1, u_0 = 0

w = 2*pi; % CTE de la EDO
b = 0.5;  % CTE de la EDO

h=0.001              % Paso con el que probamos
NI=(xmax-xmin)/h - 1 % puntos interiores 

# Formula exacta
yex= @(x) exp(0.5*(-b)*x).*cos(w*x); 
disp('    Evaluando en la formula Exacta...')
yex_2pi=yex(xmax)



# Matrices auxiliares para la formula del DF (depende del EJ!)
A=[0 1; -w**2 -b]; 
Id = eye(size(A)); % identidad 


% Implícito
yi=ymin;
ysimi=[yi];

for i=0:NI
   yip1=inv(Id - h*A)*yi;  # Pongo la formula de la DF 
   ysimi=[ysimi yip1];
   yi=yip1;
endfor  

disp('    Error para el Implicito...')
ysimi_last = ysimi(:,end)(1)  # para calcular el error tomo el ultimo valor puesto que estoy en IVP
error = abs((yex_2pi-ysimi_last))

% Explícito
yi=ymin;
ysimi=[yi];
for i=0:NI
   yip1=(Id+A*h)*yi;      # Pongo la formula de la DF 
   ysimi=[ysimi yip1];
   yi=yip1;
endfor  
disp('    Error para el Explicito...')
ysimi_last = ysimi(:,end)(1) # para calcular el error tomo el ultimo valor puesto que estoy en IVP
error = abs((yex_2pi-ysimi_last))

% Crank-nicolson
yi=ymin;
ysimi=[yi];
for i=0:NI
   yip1=inv((Id - A*h/2))*((Id + A*h/2)*yi);    # Pongo la formula de la DF 
   ysimi=[ysimi yip1];
   yi=yip1;
endfor 
disp('    Error para CN...')
ysimi_last = ysimi(:,end)(1) # para calcular el error tomo el ultimo valor puesto que estoy en IVP
error = abs((yex_2pi-ysimi_last))