clear all; clc;

h=0.2;
h2=h*h;
rm= [2-h2 1-h2 1-h2 1-h2 1-h2]';  %diagonal superior
rp= [1 1 1 1 0];  %diagonal inferior
d0= [-2 -2 -2 -2 -2 1]';
M=diag(d0)+diag(rm,1)+diag(rp,-1);
  
f=[h2 h2 h2 h2 h2 1]';

ya = M\f;
  
x=(0:1:5)'*h;
ye=2*((exp(x)+exp(-x))/(e+e^-1))-1
plot(x,yn,'or',x,ye,'-k')




clear all; clc;

h=0.1;
h2=h*h;
rm= [2-h2 1-h2 1-h2 1-h2 1-h2 1-h2 1-h2 1-h2 1-h2 1-h2]';  %diagonal superior
rp= [1 1 1 1 1 1 1 1 1 0];  %diagonal inferior
d0= [-2 -2 -2 -2 -2 -2 -2 -2 -2 -2 1]';
M=diag(d0)+diag(rm,1)+diag(rp,-1);
  
f=[h2 h2 h2 h2 h2 h2 h2 h2 h2 h2 1]';

ya = M\f;
  
x=(0:1:10)'*h;
ye=2*((exp(x)+exp(-x))/(e+e^-1))-1
plot(x,ya,'or',x,ye,'-k')
norm((ya-ye),'inf')