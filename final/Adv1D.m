clear all, 
clf 
1;
if exist('animation.pdf ', 'file')==2
  delete('animation.pdf ');
end
pulso=@(x,s,x0) exp(-(x-x0).^2/s);
_FTCS=0;
_FTFS=1;
_FTBS=2;
_LF=3;
_LW=4;
_PG=1;
_PC=0;

aview = 117.54;
bview = 46.587;
 
f=figure(1);
set(0, 'CurrentFigure', f);
clf
sOUTFile='LFCFL09818.png';%gif''test'%;'test';%
sOut3D = 'LF3DCFL09818.png'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Flags
flg_tp=10;             % Imprime cada n pasos temporales
flg_CI=_PC;            % Condición inicial _PC cuadrado _PG Gaussiano
flg_esquema=_LF;     % Esquema de resolución por DF   
flg_3D=true          %Grafico 3D         
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=0.5;     %Valor de la velocidad
xmin=0;    % extremo izquierdo
xmax=10;   %extremo derecho
x0=4;      %posición inicial del pico
s=2;       %ancho del pico
L=xmax-xmin;   %Largo del resinto físicp
NI=65;        %numero de nodos hinternos en el espacio físico
hx=L/(NI+1);  %paso espacial
alpha=0.5;
Tmax=10%alpha*L/c;       %tiempo paso de simulación
Cr=0.9;
ht=Cr*hx/c;%0.05;

Nt=floor(Tmax/ht)        %número de pasos temposrales
%Cr=c*ht/hx;
NIp2=NI+2;
NIp1=NI+1;
x=(xmin:hx:xmax)';        %nodos espaciales

if flg_CI==_PG
  u0=pulso(x,s,x0);
else
  u0=pulseC(x,s,x0);
endif 
%CFL=c*ht/hx
Cr2=0.5*Cr;                % Parametro del modelo 

fnew=u0;
fold=fnew(1:end-1);

switch flg_esquema
  case _FTBS
    ds0=(1-Cr)*ones(NIp1,1);
    dsp=Cr*[ones(NI,1);0];
    dsm=0*[ones(NIp1,1)];
    M=spdiags([dsp ds0 dsm],-1:1,NIp1,NIp1);
    M(1,end)=Cr;
  case _FTFS
    ds0=(1+Cr)*ones(NIp1,1);
    dsp=Cr*[ones(NI,1);0];
    dsm=0*[ones(NIp1,1)];
    M=spdiags([dsp ds0 dsm],-1:1,NIp1,NIp1);
    M(end,1)=-Cr;
  case _FTCS
    ds0=ones(NIp1,1);
    dsp=Cr2*[ones(NI,1);0];
    dsm=-Cr2*[ones(NIp1,1)];
    M=spdiags([dsp ds0 dsm],-1:1,NIp1,NIp1);
    M(1,end)=Cr2;
    M(end,1)=-Cr2;
case _LW
    gama=Cr2*(Cr-1);
    beta=1-Cr^2;
    alpha=Cr2*(Cr+1)
    ds0=beta*ones(NIp1,1);%OK
    dsm=gama*[ones(NI,1);0];
    dsp=alpha*[ones(NIp1,1)];
    M=spdiags([dsp ds0 dsm],-1:1,NIp1,NIp1);
    M(1,end)=alpha;
    M(end,1)=gama;
    %full(M)
case _LF
    alpha=(1-Cr)/2;
    beta=(1+Cr)/2
    ds0=0*ones(NIp1,1);%OK
    dsm=alpha*[0;ones(NI,1)];
    dsp=beta*[ones(NIp1,1)];
    M=spdiags([dsp ds0 dsm],-1:1,NIp1,NIp1);
    M(1,end)=beta;
    M(end,1)=alpha;
    full(M)
endswitch
##Evolución temporal
 for i=1 : Nt %/4-3
  t=i*ht;
  f=M*fold;
  fold=f;
  f=[f ;f(1)];
  fnew=[fnew f];

      if mod(i,flg_tp)==0
        if flg_CI==_PG
          sa=pulso(x,s,x0+c*t);
        else 
          sa=pulseC(x,s,x0+c*t);
        endif
        %s0=puseC(x,s,x0);
        plot(x,f,'-o',x,sa,'-k',x,u0,'.-r')
        shtitle=sprintf('CFL= %3.2f   tiempo %3.2f',Cr,t);
        title(shtitle)
        xlabel('x')
        legend('simulación','exacto','inicial')
        hold on
      print( sOUTFile, '-dpng')        
    endif
endfor   
if flg_3D
  hscreen= get(0, 'screensize');
  figure(2, 'position',[hscreen(3)/2,hscreen(3),hscreen(3)/2,hscreen(4)/2]);
  %hV= figure(2)
  
   t=[0:1:Nt-1]*ht;
   fnewg=fnew';
   fnewg=fnewg(1:end-1,:);
   [X T]=meshgrid(x,t);
   h=surface(X,T,fnewg);

 aview = 10.5
bview = 17 
  view(aview,bview) 
%   view(-37.5,30);
   set(h, 'EdgeAlpha',0.3);
  cbr=colorbar ();
   colormap ("Jet");
   set(cbr,'YTick',0:.1:1)
   xlabel('Espacio')
   ylabel('Tiempo')
   zlabel('u')
  print(sOut3D,'-dpng')%Dif3dimplN.png'
endif
%im = imread ("animation.pdf", "Index", "all");
%imwrite (im, sOUTFile, "DelayTime", 0.25)