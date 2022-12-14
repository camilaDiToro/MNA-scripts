# Una empresa de alquiler de coches tiene sucursales en toda la provincia de Neu-
# quén. Los autos alquilados se pueden devolverlos a cualquier otra ubicación. Para
# simplificar, imaginemos que hay tres ubicaciones y que cada cliente devuelve su
# coche a las 24 hs. Sea ⃗x(t) el vector cuyas componentes (x1 (t); x2 (t); x3 (t) son el nú-
# mero de coches a alquilar en las ubicaciones 1; 2 y 3, respectivamente. Sea A la
# matriz cuya entrada Ai j es la probabilidad de que un determinado cliente alquile
# un auto en la ubicación j y lo entregue en la ubicación i Por ejemplo, la matriz



A=[ 0.3 0.4 0.5; 0.3 0.4 0.3; 0.4 0.2 0.2];

[P D]=eig(A)

#P =
#-6.6742e-01 -7.0711e-01
#2.6726e-01
#-5.7208e-01 -2.7502e-17 -8.0178e-01
#-4.7673e-01
#7.0711e-01
#5.3452e-01
#D =
#Diagonal Matrix
#1.00000 0 0
#0 -0.20000 0
#0 0 0.10000


Pin=inv(P)
#Pin =
#-0.58267 -0.58267 -0.58267
#-0.70711
#0.23570
#0.70711
#0.41574 -0.83148
#0.41574
x0 = [0.3 0.4 0.3]’; #probabilidades iniciales
xinf = P*[1 0 0;0 0 0; 0 0 0]*Pin*x0
# xinf =
# 0.38889
# 0.33333
# 0.27778