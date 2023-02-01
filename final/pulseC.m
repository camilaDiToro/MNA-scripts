function s=pulseC(x,s,x0)
s=ones(size(x));
w1=find(x>(x0+1+s/2))
w2=find(x<(x0-1-s/2))
s(w1)=0
s(w2)=0
endfunction  
x=[0:15];
x0=8;
s=2;
pulseC(x,s,x0)