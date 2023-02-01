clear all; clc; 
inicial = 30;
left = 20; 
right = 100; 
xfinal = 1; 
xinicial = 0; 
tinicial= 0; 
tfinal = .5;  
ni = 7; 
ht=.005;
hx = (xfinal - xinicial) / (ni+1);
alpha2=2;
gamma = (alpha2*ht)/(hx^2); 
r = (2*ht)/(hx^2);
printf('r=%d\n',r);

iteraciones= tfinal/ht;
resultados = ones(ni,iteraciones+1); 
matriz = sparse(ni,ni);
d1=ones(ni,1)*(gamma);
d0=ones(ni,1)*(1-2*gamma);
B=[d1 d0 d1]; 
matriz=spdiags(B,-1:1,ni,ni); 
resultados(:,1)=inicial*resultados(:,1);

x=[0:1:ni+1]'*hx;
plot(x,[left; resultados(:,1); right], '-o','linewidth',1.2);
hold on;
for i=(2:iteraciones+1)
  resultados(:,i)=matriz * resultados(:,i-1);
  resultados(1,i)=resultados(1,i)+left*gamma;
  resultados(end,i)=resultados(end,i)+right*gamma;
  if mod(i,5)==0
    plot(x,[left; resultados(:,i); right], '-o','linewidth',1.2)
    hold on;
  endif
endfor
hold off;