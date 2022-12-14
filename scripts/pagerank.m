H = [ 0 1/2 0 0; 1/2 0 1 0; 1/2 0 0 0;0 1/2 0 0];
N = 4;
beta=0.85;
B=zeros(size(H));
B(:,4)=ones(N,1)/N;
H=H+B

Hh=beta*H+(1-beta)*ones(N)/N;
sum(Hh)
[P a] = eig(Hh,'vector')

# P =
# 0.45574
# -0.32275 - 0.25000i 
# -0.32275 + 0.25000i
# -0.40825

# a = 1.0 -0.3189 ....

# El ordenamiento de las páginas será: 1ro 2; 2do 1, 4 4to 3. NO hay mas problemas con el nodo muerto.