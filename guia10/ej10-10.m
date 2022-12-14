imgSource='lena_512x512.tiff';
imgMatrix=double(rgb2gray(imread(imgSource)));
disp(rank(imgMatrix));
## Vemos q el rango de la matriz es 507

## Calculamos cual es el k a partir del cual la descomposicion comienza a ocupar
## mas espacio en memoria que la imagen original
## Queremos el max k tal q mn > k(m+n+1) 
m=size(imgMatrix)(1);
n=size(imgMatrix)(2);
kmax=floor(m*n/(m+n+1));

## el resultado es 255.75, por lo que si queremos que la matriz ocupe menos
## espacio que la original necesitamos un k menor a 255

## Generamos imagenes con distintos k para ver "a ojo" cuantos valores singulares 
## necesitamos para obtener una imagen aceptable
[U S V]=svd(imgMatrix,'econ');
for k=[1 5 25 75 125 175 250 300 310]
  imgR=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
  sfile= ['lena' num2str(k,'%d') '.tiff']
  imwrite(uint8(imgR), sfile, 'tiff')
endfor

## Buscamos para que k la matriz tiene un % (90 %) del contenido
## energético de los modos originales
dg=diag(S);
E=sum(dg.^(2));
k=0
do
  k=k+1;
  Ek=sum(dg(1:k).^(2));
until (Ek/E > 0.99)

## con k=1 ya tenemos un valor energetico mayor al 90%. Para llegar al 99%
## necesitamos k=22