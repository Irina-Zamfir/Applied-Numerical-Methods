function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % deschid fisierul
  fid = fopen(file_path, 'r');

  % citesc headerul
  header = fgetl(fid);
  % init formatul astfel incat sa fie potrvit pt fctia de prepare_for_regression
  format = '%f%s%s%s%s%s%s%s%s%s%s%s%s';

  % citesc datele din csv cu textscan
  data = textscan(fid, format, 'Delimiter', ',');

  % salvez in Y prima coloana
  Y = data{1};
 
  % salvez in InitMax toate celelalte coloane
  InitialMatrix = [data{2}, data{3}, data{4}, data{5}, data{6}, data{7}, data{8}, data{9}, data{10}, data{11}, data{12}, data{13}];

  % inchid fisierul
  fclose(fid);

end
