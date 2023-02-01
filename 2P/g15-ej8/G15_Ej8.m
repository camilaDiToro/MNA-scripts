clear all, close all, clf

b = 1; a = 0;

N = 30;
Nm1 = N-1;
d=ones(1,Nm1)*-3;
dsup=ones(1,Nm1);
dinf=[ones(1,Nm1-2) 2 2];

B=[dinf' d' dsup'];
M=spdiags(B,-1:1,Nm1,Nm1);


%M = diag(d) + diag(dsup, 1) + diag(dinf, -1);


b = [-1 zeros(1, N - 2)]';
%X = [a:h:b];
%Yex = cosh(alpha*(1-X))/cosh(alpha);

% tic();
% M\B;
% toc()

%M = sparse(M); 

%tic();
res = M\b;
%toc()

res(end)
