clear all; clc; 
left = 0; 
right = 0; 
xfinal = 1; 
xinicial = 0; 
tinicial= 0; 
tfinal = .5;  
nt=4
ni = nt-1; 
ht=.005;
hx = (xfinal - xinicial) / (ni+1);
alpha2=1;
theta = 0.5;
beta = (alpha2*ht*(theta))/(hx^2); 
gamma = (alpha2*ht*(1-theta))/(hx^2); 
r = (2*ht)/(hx^2);
printf('r=%d\n',r);


inicial = @(x) 100*sin(pi*x);
solAnalitica = @(x,t) 100*exp(-pi*pi*t)*sin(pi*x);

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

x=[0:1:ni+1]'*hx;
iteraciones= tfinal/ht;
resultados = ones(ni,iteraciones+1); 
resultados(:,1)=inicial(x(2:end-1));
%% error
idx = floor(length(x)/2);
err = abs(resultados(idx,1)-solAnalitica(x(idx+1),0));
for i=(2:iteraciones+1)
  resultados(:,i)=me * resultados(:,i-1);
  resultados(1,i)=resultados(1,i)+left*(gamma+beta);
  resultados(end,i)=resultados(end,i)+right*(gamma+beta);
  resultados(:,i)=mi\resultados(:,i);
  err= [err abs(resultados(idx,i)-solAnalitica(x(idx+1),(i-1)*ht))];
endfor



