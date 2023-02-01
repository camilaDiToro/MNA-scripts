%function []=transformadas()
#https://www.youtube.com/watch?v=fFyjc6ozy10
clear all, close all, clf
Ts1=(5/127); 
Ts2=(5/1023); 
Ts3=(5/8192); 
Tss=[Ts1;Ts2;Ts3];
for i=1:3
  Ts=Tss(i);
  fs=1/Ts;
  inter1=0:Ts:5; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##for k=1:1:128
##  muestreo1(k)=( exp( inter1(k)*(-1) ) )* (inter1(k)>0);
##endfor 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Evaluación vectorial más rápida
  muestreo1=(5 + 4*cos(2*pi*inter1) + 3*sin(4*pi*inter1));
  %muestreo1(1)=2; %<-- la función original vale 0 en t=0, muestra1 vale 1!
  N=length(inter1);    %Numero de datos de la TF
  Notwo=N/2;           %Numero de frecuencias positivas (o f_{Nyquist})

  coef1=fft(muestreo1);    %<---- Formalmente habría que pasarle en número de puntos
%                          y este debería ser de la forma 2^p los datos viene de 
%                          esa forma OK. 
  coef1=(abs(coef1))/N;    % Usamos menos N
##coef1(2:N/2)=2*coef1(2:N/2); % No hace falta el .* ya que multiplicas por un numero 
  coef1(2:Notwo)=2*coef1(2:Notwo); 

  f=(0:Notwo)*fs/N;
  omega=f*2*pi;

%freqreal=0:0.001:26;
  tc1=abs(1.0./(1+i*omega));
  subplot(3,1,i)
  hold on

  stem(f,coef1(1:Notwo+1))
%  plot(f,tc1); 
  hold off
endfor

for i=1:3
subplot(3,1,i)
sti=sprintf('Frecuencia de muestreo %s Hz',num2str(1/Tss(i)))
title(sti)
sti=[]
endfor
