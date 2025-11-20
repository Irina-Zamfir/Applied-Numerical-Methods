function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % deschid fisierul
  fid = fopen(file_path, 'r');

  % citesc dimensiunile 
  sizes = fscanf(fid, '%d', 2);
  m = sizes(1);
  n = sizes(2);
  fgetl(fid);

  % initializez Y ca un vector de zero uri si matricea ca o mat de celule
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1:m 
    % citesc fiecare linie 
    line = fgetl(fid);

    % o sparg in functie de spatii
    token = strsplit(line);
    
    % in Y pun primul el si il fac numar
    Y(i) = str2double(token{1});
    
    % in initmax pun pe linie restul el
    for j = 1:n
      InitialMatrix{i, j} = token{j+1};
    endfor 

  endfor

  % inchid fisierul
  fclose(fid);
end
