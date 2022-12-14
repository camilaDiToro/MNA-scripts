% ====================== MODELO LINEAL SIMPLE ======================

# Ajustar serie de puntos a una recta del estilo
# y = a1 * x + a0

X = [1, 2, 3, 4, 5]'; # Valores del dominio de la tabla (valores que toma x)
b = [2.1, 3.9, 4.2, 5.5, 6.9]'; # Valores de la imagen de la tabla (valores que toma y)


A = [ones(size(X)) X];
p = pinv(A) * b

# p =
#   1.1600
#   1.1200

% ====================== MODELO POLINOMICO SIMPLE ======================

# Hay una empresa de recursos humanos que va a contratar a un nuevo candidato. 

# El candidato ha dicho que, en su otra empresa ha trabajado seis años y  medio con un salario de u$d 160 000 al año.
 
# El departamento de recursos humanos tiene que comprobar si está diciendo la verdad o si es una mentira. 

# Para corroborar los dichos del candidato, solo tienen un conjunto de datos de su empresa anterior en el que se mencionan los salarios de los 10 primeros puestos con sus niveles.



# columna 1: años de experiencia en una empresa
# columna 2: salario anual en la empresa (miles de dolares)
D = [1 45; 2 50; 3 60; 4 80; 5 110 ; 6 150; 7 200; 8 300; 9 500 ; 10 1000];

X = D(:,1); # array de años de experiencia (variable x)
b = D(:,2); # array de salario anual (variable y)

# ajuste por modelo cuadratico (ajusta puntos con una parabola)
X2 = X.^2;
A = [ones(size(X)) X X2]; # son todos vectores columna

# entrega los coeficientes del polinomio que "une" los puntos dados en D.
# sera una parabola de la forma y = p0 + p1x + p2x^2
p = pinv(A)*b; # resuelve el sistema Ap = b usando la pseudoinversa de A

polyval(flip(p), 6.5) # 189.5k, no es muy acertado

# graficando se ve que lo que mejor aproxima los puntos es un polinomio de grado 4, asi que encontremos eso
X3 = X.^3;
X4 = X.^4;

A = [ones(size(X)) X X2 X3 X4];
# entrega el modelo polinomico de grado 4 y = p0 + p1 * x + p2 * x^2 + p3 * x^3 + p4 * x^4
p = pinv(A)*b;
# evalua el modelo (polinomio) a los x = 6.5 años
polyval(flip(p), 6.5) # 158.86k, mucho mas preciso



% ====================== REGRESION LINEAL MULTIVARIADA ======================

# En este ejemplo se quiere estimar el resultado del examen final F a partir 
# de los resultados de los parciales P1 y P2 (se corrige sobre 100).
# Se quiere buscar una correlación del tipo
#   F = p0 + p1 * P1 + p2 * P2
# donde P1 y P2 son variables independientes distintas.

# TODO: add data sample D
# D = [.....]
b = D(:,1);  # notas del final
X1 = D(:,2); # notas del P1
X2 = D(:,3); # notas del P2

A = [ones(size(b)) X1 X2];
p = pinv(A)*b;

# Salida de ejemplo:

# p =
# -14.5005
# 0.4883
# 0.6720

# Esto indicaria una correlacion del tipo:
# F = -14,5005 + 0,4883P1 + 0,6720P2 # nota sobre 100


