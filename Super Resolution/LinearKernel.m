function y = LinearKernel(x)
    aboveThresh = abs(x) >= 1;
    y(aboveThresh) = 0;
    y(~aboveThresh) = 1 - abs(x(~aboveThresh));    
        
end