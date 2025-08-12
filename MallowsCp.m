function n = MallowsCp(c) % choose degree n from Chebyshev coeffs c
    N = numel(c)-1; nmax = round((N+1)/2); ells = 0:nmax;            
    sig2 = (norm(c(nmax+2:end))^2+c(end)^2)*N/2/(N-nmax);
    C = cumsum(c.^2,'reverse')'+c(end)^2;
    Cp = N/2*C(2:nmax+2)+2*sig2*(ells+1-(2*ells+1)/2/N);
    [~,n] = min(Cp); n = n-1;                    
end