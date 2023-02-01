function [A, x]= EGPP (A, b)
		[m,n] = size(A); flgsol=false;
		if (nargin==2)
				if (m==n)
						(flgsol=true);
						x = zeros(m,1);
				bb=b;
				else
						printf(’Sistema con multiples soluciones, no está pensada esta
						función\n’)
						x = zeros(n,1);bb=zeros(m,1);
				endif
		else
				bb=zeros(n,1); x = zeros(m,1);
		endif
		
		l = zeros(m,m-1);
		for k = 1:m-1
				for p = k+1:m %pivoteoparcial
						if (abs(A(k,k)) < abs(A(p,k)))
							A([k p],:) = A([p k],:);
							bb([k p]) = bb([p k]);
						endif
				endfor
				for i = k+1:m
						l(i,k) = A(i,k)/A(k,k);
						for j = k+1:n
								A(i,j) = A(i,j)-l(i,k)*A(k,j);
						endfor
						bb(i) = bb(i)-l(i,k)*bb(k);
				endfor
		endfor
		for k = 1:n-1
				for i = k+1:m
						A(i,k) = 0;
				endfor
		endfor
		
		if (flgsol) % Resolución del sistema
				A=[A bb]; x(n) = bb(n)/A(n,n);
				for i = n-1:-1:1
						x(i) = (bb(i)- A(i,i+1:m)*x(i+1:m))/A(i,i);
				endfor
		endif
endfunction