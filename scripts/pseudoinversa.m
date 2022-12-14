# Calcular la pseudoinversa de una matriz

# Si las columnas son LI:

# A+ = (A'*A)^(-1) * A' si m > n
# A+ = A' * (A*A')^(-1) si m < n

# Si no son LI:

# A+ = V * E+ * U'

format rat

A =[ 1 2; 3 4; 5 6]

[U S V]=svd(A,'econ')

Sp=[1/S(1,1) 0; 0 1/S(2,2)] # es E+ (invierto los valores singulares)

Apinv=V*Sp*U'



A*Apinv*A # verifico el resultado obtenido!


# pinv(A) # para verificar lo compruebo con lo que hace octave