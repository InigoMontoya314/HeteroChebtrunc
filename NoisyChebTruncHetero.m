function p = NoisyChebTruncHetero(f, N, sigma)
    N1 = 3*floor(sqrt(N));
    K = N;
    X = chebpts(N1);
    Y = f(X);
    E = sigma(X); % The variances at each X
    sum_of_square = sum(E.^2);
    sample_numbers = ceil(K*(E.^2) / sum_of_square); % Sample proportional to sigma^2
    for i = 1:length(X)
        num_samples = sample_numbers(i);
        sampled_errors = E(i) * randn(1, num_samples);
        Y(i) = Y(i) + mean(sampled_errors);
    end
    pN = chebfun(Y);
    c = chebcoeffs(pN);
    n = MallowsCp(c);
    p = chebfun(c(1:n+1), 'coeffs');
end