clear all; close all; clc; 

NIS=[5 20]; 
xmax=3; 
xmin=0; 
y_0= 1; 
j=1; 
real = 2*exp(1)-2; 

for ni=1:length(NIS)
  h=(xmax-xmin)/(NIS(ni)+1); 
  y=zeros(ni+2,1); 
  y=[y_0];
  for i=1:(xmax/h)
   %y_i = (i-1)*h^2+(h+1)*y(i); explicito
   %y_i = (h*(i+1)+y(i))/(1+h); %implicito 
   mitad=h/2;
   y_i = (mitad*i*h+mitad*(i-1)*h+(1+mitad)*y(i))/(1-mitad);  %%cranck-nickolson
   y=[y y_i];   
  endfor
  error(j)=abs(y(floor(1/h)+1)-real); 
  j=j+1; 
endfor