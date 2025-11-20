function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  m = size(X, 1);

  if m > 200
    X = (X - mean(X(:))) / std(X(:));
  endif

  % get a permutation 
  p = randperm(m);

  % Calculating training size 
  train_size = round(percent * m);

  % Splitting the X data set into the training matrix and testing matrix 
  X_train = X(p(1:train_size), :);
  X_test = X(p(train_size+1:m), :);

  % Splitting the Y data set into the training vector and testing vector 
  y_train = y(p(1:train_size));
  y_test = y(p(train_size+1:m));

end
