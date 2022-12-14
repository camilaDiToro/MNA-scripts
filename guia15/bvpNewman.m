clear all; clc; clf
%addpath ('/home/itba/Documents/mna/scripts/MNA-scripts/guia15')
addpath ('Path donde estna THMA')

Np=2.^[2:1:16];
a=0;
b=1;
ya=1;
ypb=0;
alpha2=4;
sqalpha=sqrt(alpha2);
err=zeros(size(Np));


flg_e='B2'

for i=1:length(Np)
N=Np(i);
Nm1=N-1;
d0=ones(N,1);
rp=ones(Nm1,1);
rm=ones(Nm1,1);
rm2=zeros(Nm1-1,1);
rp2=zeros(Nm1-1,1);


h=(b-a)/(Nm1);
x=[(0:1:Nm1)]'*h;
d=(2+alpha2*h^2);
jota=1:(Nm1);
rm= ones(Nm1,1);
rp= ones(Nm1,1);
d0=-ones(N,1)*d;
f=zeros(N,1);


switch (flg_e)
  case 'B2'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  Backward 2do Orden
d0(1)=ya;
d0(end)=3;
rp(end)=-4;
rm(1)=0;
rp2=zeros(N-2,1);
rp2(end)=1;
#comentar para usar sparse
#f(1)=ya;
#f(end)= 2*ypb*h;

#M=diag(d0)+diag(rm,1)+diag(rp,-1)+diag(rp2,-2);
#descomentar para usar sparse
M=sparse(N,N);
rsp1=[rp;0];
rsp2=[rp2;0;0];
rsm1=[0; rm];
B=[rsp2 rsp1 d0 rsm1];
M=spdiags(B,-2:1,N,N);
yn= M\f ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
case 'B1'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  Backward 1er Orden
rp(end)=-1;
d0(end)=1;
f(end)=ypb*h;
yn=[ya;THMA(rp,d0, rm,f)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
otherwise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  Centrado 2do Orden
rp(end)=2;
f(end)=-2*ypb*h;
yn=[ya;THMA(rp,d0, rm,f)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
endswitch


##
plot(x,yn,'-r','linewidth',1.2)
##
##%print -dpng 'bvpe16.png'

ye=cosh(sqalpha*(x-1))/cosh(sqalpha);
err(i)=norm((ye-yn),'inf');
vh(i)=h;
##
fprintf('Numero de puntos %i. error %f\n',N, err(i))
##
end 

plot(x,ye,'-k','linewidth',1.2)

figure(2)
loglog(vh,err,'linewidth',1.5)
set(gca, "linewidth", 1.5, "fontsize", 12)
xlabel('h')
ylabel('||y_e-y_n||_{\infty}')
##print -dpng 'bvpNCC2.png'
