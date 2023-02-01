clf(), L=2; n=400;
paso=L/(n-1);
t=[-1:paso:1]';

%armado de la funcion
f=zeros(size(t));
w=find(t>-1/2); 
f(w)=-1; 
w=find(t>0); 
f(w)=1; 
w=find(t>1/2); 
f(w)=0;
f(1)=0; 
f(n)=0;


hold on; 
plot(t,f,'DisplayName', 'Función'); 
h = findobj(gca, 'type', '5770line');
set(h, 'LineWidth', 2)
nM=[ 2 5 10 20 40 80];
%nM=[ 100 250 500 5000] 
for j=nM
  sum=0;
  for k=1:j
    sum=sum+2*(1-cos(k*pi/2))*sin(k*pi*t)/(k*pi);
  endfor
  plot(t,sum ,'DisplayName',strcat('N=',num2str(j)))
endfor
hold off, legend show
saveas (1, "Gibbs2.png")