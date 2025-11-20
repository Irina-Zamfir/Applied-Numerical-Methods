function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % deschid fisierul
  fid = fopen(file_path, 'r');

  % citesc dimensiunile matricii
  sizes = fscanf(fid, '%d', 2);
  m = sizes(1);
  n = sizes(2);

  % citesc matricea si o transpun 
  Labyrinth = fscanf(fid, '%d', [n, m]);
  Labyrinth = Labyrinth';

  % inchid fisierul 
  fclose(fid);
end