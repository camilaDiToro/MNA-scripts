%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve la ecuación
%          y'=t^2-y
%    con las condicion inicial y(0)=1
%    con NI puntos interiores
%    con h=0.2 (NI=1) y h=0.1 (NI=3)
%    se quiere obtener y(0.4) = ? 
% Es igual al ejercicio de la guia 15.4!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc
xmin=0;
xmax=1;
ymin=1;      % y(0)=1
NI=11;       % puntos interiores 

t=1;         % y(1) = ? . Es el valor que quiero conocer!!
yex=2*e^(t)-t-1;

h=(xmax-xmin)/(NI+1) % calculo el paso 
 
t = xmin:h:xmax;

% Explícito
disp('EXPLICITO');
yn=ymin;
ysim=[yn];

for n=1:NI+1     % arrays arrancan en idx=1
   ynp1=h*t(n)+(1+h)*yn;
   ysim=[ysim; ynp1];
   yn=ynp1;
endfor 

ysim;

error_expl = abs(yex-ysim(end))


% Implícito
disp('IMPLICITO');
yn=ymin;
ysim=[yn];

for n=1:NI+1
   ynp1=(h*t(n+1)+yn)/(1-h);
   ysim=[ysim; ynp1];
   yn=ynp1;
endfor 

ysim;
error_impl = abs(yex-ysim(end))


% CN
disp('CRANK NICOLSON');
yn=ymin;
ysim=[yn];

for n=1:NI+1
   ynp1=((h/2)*(t(n)+t(n+1))+(1+h/2)*yn)*(2/(2-h)); 
   ysim=[ysim; ynp1];
   yn=ynp1;
endfor 

ysim;

error_cn = abs(yex-ysim(end))