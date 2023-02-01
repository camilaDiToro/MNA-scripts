%function []=transformadas()
#https://www.youtube.com/watch?v=fFyjc6ozy10
clear all, close all, clf

Ts=2*pi/1023;
fs=1/Ts;
inter=0:Ts:2*pi; 

muestreo=cos(inter);
N=length(inter);        %Numero de datos de la TF
Notwo=N/2;              %Numero de frecuencias positivas (o f_{Nyquist})

coef=fft(muestreo);
coef=(abs(coef))/N;    % Usamos menos N
coef(2:Notwo)=2*coef(2:Notwo); 

f=(1:Notwo+1)*fs/N;
omega=f*2*pi;
stem(f,coef(1:Notwo+1))








 























https://bitbucket.org/itba/paw-2022b-6/commits/c53d4ef7f150da92fb24ad635c3fd6c024b6c20a
https://bitbucket.org/itba/paw-2022b-6/commits/d13b8b970e9e15a8dd00604ebe9e0cdf331c933e

newsjdbcdao: testdownvitedupo