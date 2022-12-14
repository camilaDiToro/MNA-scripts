# Ejercicio 15.5
disp('Obteniendo el valor maximo de h');
clear all;

function H = getMaxStep()
xmin=0;     % t_0
xmax=12;    % t_f
y0=1000;    % y(0) 
MAX_NI=100; % puntos interiores 
Km=10000;   % CTE de la formula
r0=0.294;   % CTE de la formula
H=-1;       % Valor inicial del contador H (sabemos que no puede tomar valores negativos)

for NI=10:MAX_NI
   h=(xmax-xmin)/(NI+1);          % calculo el paso 

   x=linspace(xmin, xmax, NI+1)';

   exacta = @(x) (Km*y0*e^(r0*x))/(Km+y0*(e^(r0*x)-1)); % solucion exacta (analitica de la EDO)

   % Explícito
   yi=y0;
   ysimi=[yi];
   for i=0:NI
      yip1  = yi*(h*r0*(1-yi/Km)+1);        % Aca pongo la formula de las DF explicita!
      ysimi = [ysimi; yip1];
      yi    = yip1;
   endfor 
 
   ysimi_t12  = ysimi(end);                                     % Formula del valor aproximado/simulado 
   yex_t12    = exacta(xmax);                                       %(Km*y0*e^(r0*xmax))/(Km+y0*(e^(r0*xmax)-1));

   perc_relative_error = 100*abs((yex_t12-ysimi_t12)/yex_t12); % formula del error procentual
   
   if perc_relative_error < 1 % Menor al 1%
     if h > H                 % Me quedo con el mayor H
       H = h;
     endif
   endif
endfor
endfunction

##clear all; 
##r0= 0.294; 
##K_M=10000; 
##p0=1000; 
##h=0.1; 
##t=0:h:24; 
##N=length(t); 
##
##
##aprox(1)=p0; 
##for i=2:N
##  aprox(i)= aprox(i-1)+(h*aprox(i-1)*r0*( 1 - (aprox(i-1)/K_M) ) );
##endfor
##
##real12 = (p0*K_M*(e.^(t*r0)))/(( K_M*(e.^(t*r0)) )+(K_M-p0));
##plot(t,real12,'b',1.2); 
##hold on; 
##plot(t,aprox,'rx');
##
##aproxIndex=12/h; 
##rta=abs((aprox(aproxIndex)-real12)/real12)*100; 