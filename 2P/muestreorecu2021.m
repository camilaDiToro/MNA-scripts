clear all; clc; close all; 

d1=10; %suma del legajo. 
d2=5; %suma del dni. 
fs=d1+d2; % para que no haya alias  
Ts=1/fs; 
inter=0:Ts:(1); %
inter=inter(1:end-1); 
N=length(inter);

muestreo = 3*cos(2*pi*d1*inter)-2*sin(2*pi*d2*inter);
w=exp(-i*2*pi/N); 
[I,J]=meshgrid(1:N,1:N); 
DFT = w.^((I-1).*(J-1));
coef=DFT*muestreo';
coef=fft(muestreo) ;
noTwo= (N/2); 
coef=abs(coef)/N; 
coef(2:noTwo)= 2*coef(2:noTwo); 
frecs=(0:noTwo)*fs/N; 

stem(frecs,coef(1:noTwo+1)); 


 

