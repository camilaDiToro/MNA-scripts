clear all, close all, clf

%datos
r0=0.294;
p0=1000;
km=10000;
t=12;
errobj = 1; %error que queremos obtener (en %)
pex=(p0*km)/(exp(-r0*t)*(km-p0) + p0) %valor exacto de p(t)

% 1. Tomo una cantida de pasos inicial  
T=12;
h = t/T; % paso = longitud del intervalo / cantidad de pasos
psig = p0;
  
for i=h:h:t
    pant = psig;
    %calculo del siguiente valor de p(t) mediante euler explicito
    psig = h*r0*(1-pant/km)*pant + pant;
endfor
  
err = abs((pex-psig)/pex)*100;
  
% 2. Tomo una mejor aproximacion para T, dado que el metodo es lineal
T = floor(T * (err/errobj));  

% 3. Calculo nuevamente la aproximacion y su error
h = t/T; % paso = longitud del intervalo / cantidad de pasos
psig = p0;
  
for i=h:h:t
    pant = psig;
    %calculo del siguiente valor de p(t) mediante euler explicito
    psig = h*r0*(1-pant/km)*pant + pant;
endfor
  
err = abs((pex-psig)/pex)*100;

% 4. Queremos la minima cantidad de pasos que nos den un error menor a 1%
% Seguramente estemos cerca de este valor. Si tenemos un error menor a 1%, 
% para afirmar que tenemos el minimo debemos asegurarnos
% que si reducimos la cantidad de pasos en 1, el error supera el 1%. Si el error supera el 1%
% podemos aumentar la cantidad de pasos en 1 hasta obtener un error menor.

var = 1; %Podemos querer aumentar o bien decrementar T en 1.
if(err < errobj)
  var = -1;
endif
-+
do 
  Tant = T; % guardamos el T de la iteracion anterior
  T = T + var;  
  h = t/T; % paso = longitud del intervalo / cantidad de pasos
  psig = p0;
    
  for i=h:h:t
      pant = psig;
      psig = h*r0*(1-pant/km)*pant + pant;
  endfor
    
  err = abs((pex-psig)/pex)*100;
until err * var < errobj * var

%Valor de h solicitado:
h = t/Tant