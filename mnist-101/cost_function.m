function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  % reshaping the weight vector into the 2 matrixes for liniar transformations
  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size+1)), ...
                  hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(params((1 + hidden_layer_size * (input_layer_size+1)):end), ...
                  output_layer_size, (hidden_layer_size + 1));
  
  % Forward propagation
  m = size(X, 1); %number of examples

  % Add bias to input layer
  a1 = [ones(m, 1) X];

  % Hidden layer liniar transformation using activation function
  z2 = a1 * (Theta1)';
  a2 = sigmoid(z2);

  % Add bias to hidden layer
  a2 = [ones(m, 1) a2];

  % Output layer liniar transformation using activation function 
  z3 = a2 * (Theta2)';
  a3 = sigmoid(z3);

  y_matrix = eye(output_layer_size)(y, :); 

  % Computing the errors + Backpropagation
  % ouput layer error 
  delta3 = a3 - y_matrix;

  % Calculate the derivative of the activation function 
  invsigmoid = sigmoid(z2) .* (1-sigmoid(z2));
  % hidden layer error 
  delta2 = (delta3 * Theta2)(:, 2:end) .* invsigmoid;

  % Determine the gradients
  % Gradient for transition between hidden layer and output layer
  Delta2 = (delta3)' * a2;
  % Gradient for transition between for input layer and hidden layer 
  Delta1 = (delta2)' * a1; 

  % Dividing the gradients to the number of training sets 
  Theta1_grad = Delta1 / m;
  Theta2_grad = Delta2 / m;

  % Adding regularization without bias 
  Theta1_grad(:, 2:end) += (lambda/m) * Theta1(:, 2:end);
  Theta2_grad(:, 2:end) += (lambda/m) * Theta2(:, 2:end);
  
  % Final J and grad
  % Cost without regularization 
  J = (-y_matrix(:)' * log(a3(:)) - (1 - y_matrix(:)') * log(1 - a3(:))) / m;

  % Calculating the regularization 
  term2 = lambda * (Theta1(:, 2:end)(:)' * Theta1(:, 2:end)(:) + ...
          Theta2(:, 2:end)(:)' * Theta2(:, 2:end)(:)) / (2*m);

  % Adding regularization to final cost
  J = J + term2;

  % Get final gradient column vector 
  grad = [Theta1_grad(:); Theta2_grad(:)];

end
