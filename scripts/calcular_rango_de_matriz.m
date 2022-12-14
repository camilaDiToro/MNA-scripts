% Dado A matriz calcular su rango mediante svd() 
% (ya que se puede hacer con rank(A))

A = [1 1 1 1 1; 0 0 0 0 0; -1 -1 -1 -1 -1; 0 0 0 0 0; 1 1 1 1 1; -1 -1 -1 -1 -1; 0 0 0 0 0];

[U S V] = svd(A, 'econ')


% S =

% Diagonal Matrix

%    4.4721        0        0        0        0
%         0        0        0        0        0
%         0        0        0        0        0
%         0        0        0        0        0
%         0        0        0        0        0

% Luego nos damos cuenta que dim(S) = 1 => dim(A) = 1
