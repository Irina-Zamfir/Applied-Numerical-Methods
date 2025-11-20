function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % dim lui FeatMat
  [m, n] = size(FeatureMatrix);

  suma = 0;
  % merg pe linii in matrice
  for i = 1:m

    % calc val prezisa
    x = FeatureMatrix(i, :);
    h0 = x * Theta(2:n+1);

    % aplic formula pt suma
    suma = suma + (Y(i) - h0) * (Y(i) - h0);

  endfor

  % aflu norma 1 lui Theta
  norma = norm(Theta, 1);

  % calulez eroarea (val functiei regularizate de cost)
  Error = suma/m + lambda*norma;

end
