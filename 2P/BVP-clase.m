clear all; clc;


Np=2.^[2:1:14];
a=0; 
b=1;
err=zeros(size(Np));

for i=1:length(Np)
  N=Np(i);
  Nm1=N-1;
  h=(b-a)/N;
  d=-2*(1+h^2);    %diagonal
  jota=1:(Nm1);  
  rm= 1-jota*h^2;  %diagonal superior
  rp= 1+jota*h^2;  %diagonal inferior
  t0=tic();
  d0=ones(Nm1,1)*d; %diagonal
  M=diag(d0)+diag(rm(1:end-1),1)+diag(rp(2:end),-1);
  
  f=zeros(Nm1,1);
  f(1)=-(1+h^2);
  f(N-1)=-e*(1-(Nm1)*h^2);

  %Descomentar las lineas p%ara usar el algoritmo de THMA
  ynO=[1;THMA(rp,d0, rm,f); e];
  yn=ynO
  
  clear d0 rm rp;
  %ynO=[1; M\f ;e];
  %yn=ynO;
  
  x=(0:1:N)'*h;
  ye=e.^(x.^2);
  plot(x,yn,'or',x,ye,'-k')
  hold on
  tf=toc(t0);
  err(i)=norm((ye-yn),'inf');
  vh(i)=h;
  sf='Numero de puntos %i. \nTiempo %f\n';
  fprintf(sf,N, tf)
endfor