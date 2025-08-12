function p = HeteroChebtrunc(f, N, sigma)
    Nhat = floor(sqrt(N)); % Number of Chebyshev points
    N1 = floor(0.1 * N); % Increased presample budget
    X = chebpts(Nhat); % Chebyshev points
    Y = f(X);
    E = sigma(X); % Noise standard deviations
    E_sampled = zeros(Nhat, 1);
    num_presample = floor(N1 / Nhat); % Number of presamples per point
    presample_sum = zeros(Nhat, 1);
    test_final_errors = zeros(Nhat, 1);

    % Presampling to estimate variance
    for i = 1:length(X)
        sample_errors = E(i) * randn(1, num_presample);
        E_sampled(i) = var(sample_errors) + 1e-10; % Add small constant to avoid zero variance
        presample_sum(i) = sum(sample_errors);
    end

    % Proportional sample allocation
    sum_of_squares = sum(E_sampled);
    sample_numbers = ceil(((N - N1) / sum_of_squares) * E_sampled);

    % Final sampling and noise addition
    for i = 1:length(X)
        if num_presample >= sample_numbers(i)
            final_error = presample_sum(i) / num_presample;
        else
            new_sample_num = sample_numbers(i) - num_presample;
            sampled_errors = E(i) * randn(1, new_sample_num);
            final_error = (sum(sampled_errors) + presample_sum(i)) / sample_numbers(i);
        end
        test_final_errors(i) = final_error;
        Y(i) = Y(i) + final_error;
    end
    % The rest is the same as classical NoisyChebtrunc
    pN = chebfun(Y);
    c = chebcoeffs(pN);
    n = MallowsCp(c); 
    p = chebfun(c(1:n+1), 'coeffs');
end
