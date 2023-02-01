clf(), n=50;
paso=2*pi/(n-1);

%intervalo de analisis
t=[-pi:paso:pi]';

%armado de la funcion 
f=sin(t); 
w=find(f<0);
f(w)=0; 


hold on
%a0
A=1/pi+sin(t)/2;
err=[];
nM=[ 2 5 10 20 40 80];

for j=nM
  sum=A;
  for k=1:j
    %an
    sum=sum+2*cos(2*k*t)/(pi*(1-4*k^2)); 
  endfor
  err=[err norm(f-sum)];
  plot(t,sum ,'DisplayName',strcat('N=',num2str(j)));
endfor

hold off, legend show
saveas (1, "ejemplo1.png")
semilogy(nM,err,'*')