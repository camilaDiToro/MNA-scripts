# Sea b = (3 2 1)' y A = [3.25 1; 2.55 1; 1.40 1] 

# Hallar p en el sentido de los cuadrados minimos
# (i.e. aceptamos una solucion que cumpla con la condicion que la distancia entre 
# el vector independiente real y su proyeccion en el espacio columna de A sea
# minima).

b = [3 2 1]'
A = [3.25 1; 2.55 1; 1.40 1]

disp('Utilizando la funcion pinv() ...')
p = pinv(A) * b

disp('Utilizando el metodo iterativo QR ...')
[Q R] = qr(A);

p = linsolve(R, Q' * b)