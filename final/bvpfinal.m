

s = 0; %extremo derecho
e = 1; %extremo izquierdo
d = 0.1;
NI = 4; %puntos interiores
hx = (e-s)/(NI+1);

a = -d/(hx*hx) -1/(2*hx);
b = 2*d/(hx*hx);
c = -d/(hx*hx) +1/(2*hx);

M=sparse(NI,NI);
ds = [0; ones(NI-1,1)*c];
d  = ones(NI,1)*b;
di = [ones(NI-1,1)*a;0];

B=[di d ds];
M=spdiags(B,-1:1,NI,NI);

p=ones(NI,1);

rta = [0; M\p; 0]';

%%%% calculo error
C = @(x) x - (exp(-(1-x)/D-exp(-1/D)))/(1-exp(-1/D));
pts = 0:hx:1;
ex = C(pts);
norm((ex-rta),'inf');