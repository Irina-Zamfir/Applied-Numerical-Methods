function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % iau dimensiunile lui FeatMat si init vectorii cu care voi face
  %metoda gradientului conjugat
  [m, n] = size(FeatureMatrix);
  x0 = zeros(n, 1); 
  x = x0;
  r0 = Y - FeatureMatrix*x0;
  r1 = r0;
  v1 = r0;
  v2 = v1;

  % ridic tol la patrat 
  tol2 = tol * tol;

  for k = 1:iter

    % calculez solutiile curente
    aux = (v1)' * FeatureMatrix * v1;
    t = ((r0)' * r0)/aux;

    x = x0 + t*v1;
    r1 = r0 - t*FeatureMatrix*v1;

    s = ((r1)' * r1)/((r0)' * r0);
    v2 = r1 + s*v1;

    % daca eroarea este mai mica decat toleranta ies din loop
    if ((r0)' * r0) < tol2
      break;
    endif

    % solutiile curente devin sol precedente 
    r0 = r1;
    v1 = v2;
    x0 = x;
  endfor

  % Theta devine ultimul x calculat cu un 0 in fata
  Theta = [0; x];

end
