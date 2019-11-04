function y = GaussianKernel(x, sigma)
    y = exp(-(x.^2) ./ (2 * sigma^2));
end