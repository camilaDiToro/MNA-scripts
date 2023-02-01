
clear all ; close all; clc
w=2*pi;
b=0.5;
H = [0.1, 0.01, 0.001];
A = [0 1 ; -w^2 -b];
Y0=[1 0]';

for j=1:length(H)
  
  h=H(j);
  
  %Matriz de paso para euler explicito
  PE = h*A + eye(2);

  inter = 0:h:2*pi;
  eexp = [Y0 zeros(2,length(inter)-1)];

  for i=2:length(inter)
    eexp(:,i) = PE*eexp(:,i-1);
  endfor


  %Matriz de paso para euler implicito
  PI = eye(2) -  h*A;
  eimp = [Y0 zeros(2,length(inter)-1)];

  for i=2:length(inter)
    eimp(:,i) = PI\eimp(:,i-1);
  endfor

  %Crank Nicolson
  cnic = [Y0 zeros(2,length(inter)-1)];
  for i=2:length(inter)
    cnic(:,i) = PI\(PE*eimp(:,i-1));
  endfor
  subplot(3,1,j);
  plot(inter, eexp(1,:), '-m' ,inter, eimp(1,:), '-r', inter, cnic(1,:), '-g');
  legend('Euler explicito', 'Euler implicito', 'Crank Nicolson');
endfor



