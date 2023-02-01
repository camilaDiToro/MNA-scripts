%                  Roberto Vieytes
%                  rvieytes@itba.edu.ar
% Created: 2021-10-01 Licenciado bajo  CC BY-SA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Métodos Numéricos Avanzados                               %
%                             2C 2021                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Este script evalúanla diferrencia entre la derivada obtenida por MDF y la %
%    exacta, en función del tamaño del paso de discretización                  %
%    Se evalúa un esquema progresivo (Fordward) , regresivo (Backward)         %
%    y centrado                                                                %
%                                                                              %
%    Es un guión para estudiantes. No está optimizado.                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc
xmax=4;
Nmax=35;
Fun = @(x) exp(-x).*sin(3*x); 
dFun = @(x) -exp(-x).*sin(3*x)+ 3*exp(-x).*cos(3*x);
x=linspace(0,xmax,Nmax+1);
F=Fun(x);
h=x(2)-x(1);
xCentral=x(2:end-1);
dFCenteral=(F(3:end)-F(1:end-2))/(2*h);
xForward=x(1:end-1);
dFForward=(F(2:end)-F(1:end-1))/h;
xBackward=x(2:end);
dFBackward=(F(2:end)-F(1:end-1))/h;
hscreen= get(0, 'screensize');
figure(1, 'position',[0,hscreen(3),hscreen(3)/2,hscreen(4)/2]); 
plot(x,dFun(x));
hold on
plot(xCentral,dFCenteral,'r')
plot(xForward,dFForward,'k');
plot(xBackward,dFBackward,'g');
legend('Analytic','Centred','Forward','Backward')
hold off;
x0=2;
dh=2*xmax/Nmax;
F0=Fun(x0);
dF0=dFun(x0);
Fordward=[];
Backward=[];
Centred=[]
hh=2*dh;
h=[];
fprintf('      h,       Analitica   ,    Fordward   ,   Backward   ,    Centred\n')
for i=1:Nmax;
    hh=hh/2;
    fw = (Fun(x0+hh)-F0);
    fb =(-Fun(x0-hh)+F0);
    fc = (Fun(x0+hh)-Fun(x0-hh));
  Fordward=[Fordward abs((fw/hh-dF0))];
  Backward=[Backward abs((fb/hh-dF0))];
  Centred =[Centred abs((fc/(2*hh)-dF0))];
    h=[h hh];
  fprintf(' %1.6e, %1.6e, %1.6e, %1.6e, %1.6e\n',hh, dF0,abs((fw/hh-dF0)/dF0), ...
  abs((fb/hh-dF0)/dF0), abs((fc/(2*hh)-dF0)/dF0))
endfor
figure(2, 'position',[hscreen(3)/2,hscreen(3),hscreen(3)/2,hscreen(4)/2]);
figure 2, loglog(h, Fordward, '-r',h,  Backward, '-g', h, Centred, '-b');
legend('Forward','Backward', 'Centred')
