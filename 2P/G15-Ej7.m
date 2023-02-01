clear all; clc;

a=0; 
b=4;
N=2^5;
Nm1=N-1;
h=(b-a)/N;
jota=1:(Nm1);  
rm= ones(Nm1,1);  %diagonal superior
rp= ones(Nm1,1);  %diagonal inferior
d0=-(2+jota*h^3); %diagonal
M=diag(d0)+diag(rm(1:end-1),1)+diag(rp(2:end),-1);
  
f=zeros(Nm1,1);
f(1)=-0.35503;
f(N-1)=0;

%Descomentar las lineas p%ara usar el algoritmo de THMA
%ynO=[1;THMA(rp,d0, rm,f); e];
%yn=ynO
  
clear d0 rm rp;
ynO=[0.35503; M\f ;0];
yn=ynO;
  
x=(0:1:N)'*h;
ye=airy(0,x);
plot(x,yn,'or',x,ye,'-k')
