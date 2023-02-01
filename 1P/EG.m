function [A x] = EG(A,b)
		[m n] = size(A);
		switch nargin
				case 1;
						flgsol=false;
						b=zeros(m,1);
				case 2;
						flgsol=true;
					x=zeros(m,1);
		end
		n=n+1;
				A=[A b];

		for k = 1 : m
				for j = k+1 : n-1
						ljk=A(j,k)/A(k,k);
						A(j,k:n) = A(j,k:n) - ljk*A(k,k:n);
				endfor
		endfor
		
## Resuelve el sistema Ax=b
		if flgsol
				b=A(:,n);
				x(m)=b(m)/A(m,m);
				for i=m-1:-1:1
						x(i) = (b(i)-A(i,i+1:m)*x(i+1:m))/A(i,i)
				endfor
		else
				A=A(:,1:n-1)
		endif
endfunction
