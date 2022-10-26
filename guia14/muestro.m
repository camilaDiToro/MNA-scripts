disp("Starting...");


% Se limpia memoria
clear all, close all, clf

format rat

% f: puntero a la funcion continua a ser muestreada
% F: puntereo a la transformada continua de fourier
% Ts: periodo de sample (ie, cada cuanto tomo una muestra)
% interval_left: principio del intervalo
% interval_right: final del intervalo
% number_of_graphs: cantidad de graficos a hacer (ie, cantidad de periodos que quiero muestrear)
% i: subplot a ser graficado
function Fk = graph_fft(f, F, Ts, interval_left, interval_right, number_of_graphs, i)
   fs = 1 / Ts;                                     % Frecuencia de sample
   interval = interval_left:Ts:interval_right;      % Intervalo en el que se muestrea la funcion
   N = length(interval);                            % Obtengo la longitud del interavlo
   xn = f(interval);                                % Obtengo las muestras de f
   fN = N / 2;                                      % Obtengo la f_{Nyquist}
   
   Fk = fft(xn);                                    % Obtengo la Transformada rapida (discreta) de fourier
   
   % Dibujamos la Transformada Rapida (Discreta) de Furier
   Ak = Fk;                 % ! Formula del espectro de amplitud
   Ak = abs(Ak)/N;          % !             !
   Ak(2:fN) = 2 * Ak(2:fN); % !             !

   f = (1:fN + 1) * fs / N;
  
   subplot(number_of_graphs, 1, i);
   hold on                               
   stem(f, Ak(1:fN + 1));                           % Grafico la FFT
   omega = f*2*pi; 
   plot(f, F(omega));               % Grafico la CFT (transformada continua) para comparar
   hold off   
   
   subplot(number_of_graphs, 1, i);
   sti = sprintf('Frecuencia de muestreo %s Hz', num2str( fs ))
   title(sti);
   sti = [];
   
   %fprintf('%f + (%f i)', [real(Fk)' imag(Fk)']');
endfunction


% Defino funcion continua a ser muestreada
function y = f(t)
  y = exp(-t).*(t>0);
endfunction  

% Coloco el valor absoluto de transformada continua de f(t) calculada en papel
function y = F(omega)
   y = abs(1./(1 + i*omega))
endfunction

% Defino periodos de muestreo 
Ts1 = 5/127; 
Ts2 = 5/1023; 
Ts3 = 5/8192; 
Tss = [Ts1; Ts2; Ts3];

for i=1:length(Tss)
  Fk = graph_fft(@f, @F, Tss(i), 0, 5, length(Tss), i);
  %for j=1:length(Fk)
  %  Fk(j)
  %endfor
endfor

disp("Ending...");
disp("Podes obtener valores de la ultima transformada usando Fk(i) en la CLI")
