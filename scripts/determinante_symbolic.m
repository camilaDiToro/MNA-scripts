#
# Dada una matriz simbolica de parametro "m", 
# encuentra el m para que la matriz sea singular
#

pkg load symbolic

syms m

A = [[m, -1, 3]; [2, 0, 4]; [1, -1, 2]];


determinante = det(A)

solve(determinante == 0, m)