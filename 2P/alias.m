# la senal a muestrear
signal = @(x) 1*sin(450*pi*x) + 1*sin(50*pi*x);
# la frecuencia con la que muestreo (cambiar de 1451 a 500)
f = 1000*pi;
# muestreo un 0.1 segundo de senal
max_time = 40;
x = [0:1/f:max_time];
# opcional: plot de la funcion
#plot(x,signal(x));
# calculo de la transformada
transform = fft(signal(x));
# tengo que transformar mi espacio x tiempo a espacio x frecuencias
# fft devuelve las frecuencas en este orden [0 ... nysq -nysq ...]
# Osea todos los positivos primeros hasta la freq de nysquit y despues los negativos
# Voy a agarrar solo las frecuencias positivas y voy a escalar el eje x de acuerdo a eso
N = length(x);
first_half = 1:N/2;
freqs = x(first_half)*f/max_time;
plot(freqs,abs(transform(first_half)))
