# Se tienen los datos de las HORAS de luz solar del primer dia de cada mes.
# Se quiere aproximar estos datos por una funcion del estilo
# D(mes) = p0 + p1 * sin(pi/6 * m) + p2 * cos(pi/6 * m)
#
# Determinar la duracion del dia 16 de septiembre.

# Matriz de datos
D = [
  1 14.414;
  2 13.748;
  3 12.804;
  4 11.682;
  5 10.687;
  6 9.977;
  7 9.885;
  8 10.449;
  9 11.408;
  10 12.469;
  11 13.540;
  12 14.306
];

mes = D(:, 1); # meses de la tabla
TD = D(:, 2);  # duracion en HORAS de cada mes de la tabla

w = pi/6;
# planteamos el problema como una regresion lineal multivariada, tomando como variables independientes al seno y al coseno
A = [ones(size(mes)) sin(w*mes) cos(w*mes)];

p = pinv(A) * TD; # resolvemos el sistema Ap = TD usando la pseudoninversa de A

p0 = p(1)
p1 = p(2)
p2 = p(3)

# el 16 de septiembre corresponde al mes 9 + 16/30 (16 dias de los 30 del mes), es decir, al mes 9.533
sept16 = 9 + 16/30;
# evaluamos nuestro modelo en el punto pedido
D = @(mes) p0 + p1*sin(pi/6 * mes) + p2*cos(pi/6 * mes);
D(sept16)