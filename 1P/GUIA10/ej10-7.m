fid = fopen('pressure.dat', 'r');
m = textscan(fid, '%f %f %f');
fclose(fid);
#m{1} = p ,  m{2}=e  , m{3}=m
b=m{1};
X1=m{2};
X2=m{3};
A=[ones(size(X1)) X1 X2];
p=pinv(A)*b