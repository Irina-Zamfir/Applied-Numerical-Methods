function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)

  % open the file
  fid = fopen(path, 'r');

  % load the path into the variable
  var = load(path, 'X', 'y');

  % save the data in X and y
  X = var.X;
  y = var.y;

  % close the file 
  fclose(fid);

end
