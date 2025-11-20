function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % iau dimensiunile matricii 
  [m, n] = size(FeatureMatrix);

  % init suma cu 0 si merg pe linii in mat
  suma = 0;
  for i = 1:m

    % calculez h0 (val prezisa pt functionalitati)
    x = FeatureMatrix(i, :);
    h0 = x * Theta(2:n+1);

    % calc suma conform formulei din cerinta
    suma = suma + (h0 - Y(i)) * (h0 - Y(i));

  endfor

  % calculul final al erorii (val functiei de cost)
  Error = suma/ (2*m);

end
