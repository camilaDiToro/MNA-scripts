clear all; clc; 
inicial = 30;
left = 20; 
right = 100; 
xfinal = 1; 
xinicial = 0; 
tinicial= 0; 
tfinal = .5;  
ni = 4; 
ht=.005;
hx = (xfinal - xinicial) / (ni+1);
alpha2=2;
theta = 1;
beta = (alpha2*ht*(theta))/(hx^2); 
gamma = (alpha2*ht*(1-theta))/(hx^2); 
r = (2*ht)/(hx^2);
printf('r=%d\n',r);


%matriz explicita
me = sparse(ni,ni);
d1=ones(ni,1)*(gamma);
d0=ones(ni,1)*(1-2*gamma);
B=[d1 d0 d1]; 
me=spdiags(B,-1:1,ni,ni); 

%matriz implicita
mi = sparse(ni,ni);
d1=ones(ni,1)*(-beta);
d0=ones(ni,1)*(1+2*beta);
B=[d1 d0 d1]; 
mi=spdiags(B,-1:1,ni,ni); 
imi=inv(mi);

iteraciones= tfinal/ht;
resultados = ones(ni,iteraciones+1); 
resultados(:,1)=inicial*resultados(:,1);
x=[0:1:ni+1]'*hx;
plot(x,[left; resultados(:,1); right], '-o','linewidth',1.2);
hold on;
for i=(2:iteraciones+1)
  resultados(:,i)=me * resultados(:,i-1);
  resultados(1,i)=resultados(1,i)+left*(gamma+beta);
  resultados(end,i)=resultados(end,i)+right*(gamma+beta);
  resultados(:,i)=imi * resultados(:,i);
  if mod(i,5)==0
    plot(x,[left; resultados(:,i); right], '-o','linewidth',1.2)
    hold on;
  endif
endfor
hold off;