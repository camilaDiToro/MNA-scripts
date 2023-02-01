s= urlread("https://stats.oarc.ucla.edu/wp-content/uploads/2016/02/p076.sps_.txt");
ni=rindex(s,'begin data');
nf=rindex(s,'end data');

##substr(string, offset, longitud)
strD=substr(s,ni+12,nf-ni-12);
D=str2num(strD);

##### Regresion multilineal
b=D(:,1);
X1=D(:,2);
X2=D(:,3);
A= [ones(size(b)) X1 X2];
p=pinv(A)*b


##### OTRA FORMA DE LECTURA, DESDE UN ARCHIVO (q no esta en ningun lado)
# El conjunto de datos se encuentra en el archivo P027.2p2.txt; tiene una linea
# de encabezado y luego un registro por cada reparación; donde el primer dato es el tiempo
# empĺeado para la reparación (en minutos) y el segundo, el número de elementos reem-
# plazados. Como primer paso siempre se debe realizar un gráfico que permita observar la
# distribución de los mismos, en la figura 7.5 se observa esta distribución.

fid = fopen('P027.sps.txt', 'r');
m = textscan(fid, '%f %d','HeaderLines',1);
fclose(fid);