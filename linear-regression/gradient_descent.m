function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % init vect de weights
  Theta = zeros(n, 1);

  for k = 1:iter

    for j = 1:n 

      suma = 0;
      % merg pe linii in matrice
      for i = 1:m

        % iau fiecare linie si calc h0 si cresc suma (deriv partiala)
        x = FeatureMatrix(i, :);
        h0 = x * Theta;
        suma = suma + (h0 - Y(i)) * x(j);

      endfor

      suma = suma/m;
      % Calc weight-ul pt predictor conform formulei date
      Theta(j) = Theta(j) - alpha*suma;

    endfor

  endfor

  % adaug un zero vectorului de weights
  Theta = [0; Theta];

end
