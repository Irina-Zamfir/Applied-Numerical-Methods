function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % iau dimensiunile si init Feature matrix sa tine max 2*n coloane
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, 2*n);
  max_colums = 0; %init o var care sa tina minte nr max de coloane 

  for i =1:m
    
    % tin un contor pt a creste coloanele in FeatureMat
    cnt = 0;
    for j = 1:n
      % daca am 'yes', pun 1 in mat 
      if(strcmp(InitialMatrix{i, j}, "yes"))
        FeatureMatrix(i, cnt+1) = 1;
        cnt = cnt+1;
      % daca am 'no', pun 0 in mat 
      elseif(strcmp(InitialMatrix{i, j}, "no"))
        FeatureMatrix(i, cnt+1) = 0;
        cnt = cnt+1;
      % daca am 'semi-furnished', pun 1 si 0 in mat 
      elseif(strcmp(InitialMatrix{i, j}, "semi-furnished"))
        FeatureMatrix(i, cnt+1) = 1;
        FeatureMatrix(i, cnt+2) = 0;
        cnt = cnt+2;
      % daca am 'unfurnished', pun 0 si 1 in mat
      elseif(strcmp(InitialMatrix{i, j}, "unfurnished"))
        FeatureMatrix(i, cnt+1) = 0;
        FeatureMatrix(i, cnt+2) = 1;
        cnt = cnt+2;
      % daca am 'furnished', pun 0 si 0 in mat
      elseif(strcmp(InitialMatrix{i, j}, "furnished"))
        FeatureMatrix(i, cnt+1) = 0;
        FeatureMatrix(i, cnt+2) = 0;
        cnt = cnt+2;
      % altfel stiu ca am numar, si pun nr in mat
      else 
        FeatureMatrix(i, cnt+1) = str2double(InitialMatrix{i, j});
        cnt = cnt+1;
      endif

      % daca nr de col curent mai mare decat max, schimb nr max
      if cnt > max_colums
        max_colums = cnt;
      endif

    endfor
  endfor
    
  % Salvez in FeatureMat, matricea pana la nr maxim de coloane
  FeatureMatrix = FeatureMatrix(:, 1:max_colums);

end
