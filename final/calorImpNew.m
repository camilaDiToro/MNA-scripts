clear all; clc; 
inicial = 30;
left = 20; 
right = 100; 
xfinal = 2; 
xinicial = 0; 
tinicial= 0; 
tfinal = 0.5;  
ni = 6; 
ht=.1;
hx = (xfinal - xinicial) / (ni);
alpha = (2*ht)/(hx^2); 

iteraciones= tfinal/ht;
resultados = ones(ni,iteraciones+1); 
matriz = sparse(ni,ni);
d_1=ones(ni,1)*(-alpha);
d0=ones(ni,1)*(2*alpha);
d1=ones(ni,1)*((1-alpha));
d1(2)=d1(2)-alpha;
d_1(end-1)=d_1(end-1)-alpha+1;
B=[d_1 d0 d1]; 
matriz=spdiags(B,-1:1,ni,ni);
resultados(:,1)=inicial*resultados(:,1);
resultados(3,1)=0;
inv=inv(matriz); 

for i=(2:iteraciones+1)
  resultados(:,i)=inv * resultados(:,i-1);
endfor