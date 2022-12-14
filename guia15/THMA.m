
function x = THMA (a,b,c, d)
## a subdiagonal
## b diagonal principal 
## c supradiagonal          
## b vector independiente    
N = length(d);
 
% Modify the first-row coefficients
c(1) = c(1) / b(1); % Division by zero risk.
d(1) = d(1) / b(1); 
 
for n = 2:1:N
    temp = b(n) - a(n) * c(n - 1);
    if (n<N)
        c(n) = c(n) / temp;
    end
    d(n) = (d(n) - a(n) * d(n - 1)) / temp;
end
 
% Now back substitute.
x(N) = d(N);
for n = (N - 1):-1:1
    x(n) = d(n) - c(n) * x(n + 1);
end 
x=x';
endfunction
