### Calidad de imagenes. En la guia la imagen tiene rango 610, cambio los valores
### porq la mia tiene 318.
imgSource='mariposas.jpeg';
imgMatrix=double(rgb2gray(imread(imgSource)));
disp(rank(imgMatrix));
for k=[1 5 25 75 125 175 250 300 310]
  imgR=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
  sfile= ['mariposas' num2str(k,'%d') '.jpeg']
  imwrite(uint8(imgR), sfile, 'jpeg')
endfor