% A simple implementation of a gradient descent optimization.
function x = GradientDescent(lhs, rhs, initialGuess)
   maxIter = 150;
   iter = 0;
   eps = 0.01;
   
   x = initialGuess;
   res = lhs' * (rhs - lhs * x);
   mse = res' * res;
   mse0 = mse;
   while (iter < maxIter && mse > eps^2 * mse0)
       res = lhs' * (rhs - lhs * x);
       x = x+res;
       mse = res' * res;
       fprintf(1, 'Gradient Descent Iteration %d mean-square error %3.3f\n', iter, mse);
       iter = iter + 1;
   end

end