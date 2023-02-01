
clear all ; close all; clc

H = [1/2 1/7];
f0=1;
lim=1;

error_eexp = zeros(1,2);
error_eimp = zeros(1,2);
error_cnic = zeros(1,2);

for j=1:length(H)
  
  h=H(j);
  inter = 0:h:lim;
  
  % euler explicito
  eexp = [f0 zeros(length(f0),length(inter)-1)];

  for i=1:length(inter)-1
    eexp(:,i+1) = (1+h)*eexp(:,i) + h*h*(i-1);
  endfor

  %Matriz de paso para euler implicito
  eimp = [f0 zeros(length(f0),length(inter)-1)];

  for i=1:length(inter)-1
    eimp(:,i+1) = (eimp(:,i)+(i)*h*h)/(1-h);
  endfor

  %Crank Nicolson
  cnic = [f0 zeros(length(f0),length(inter)-1)];;
  for i=1:length(inter)-1
    cnic(:,i+1) = ((1+0.5*h)*cnic(:,i) + 0.5*(i*h*h) + 0.5*((i-1)*h*h))/(1-0.5*h);
  endfor
  
  yex = 2*exp(inter) - inter -1;
  
  subplot(length(H),1,j);
  plot(inter, eexp, '-m' ,inter, eimp, '-r', inter, cnic, '-g', inter, yex);
  legend('Euler explicito', 'Euler implicito', 'Crank Nicolson');
  
  error_eexp(j) = 2*exp(lim) - lim -1 - eexp(length(inter));
  error_eimp(j) = 2*exp(lim) - lim -1 - eimp(length(inter));
  error_cnic(j) = 2*exp(lim) - lim -1 - cnic(length(inter));
endfor



