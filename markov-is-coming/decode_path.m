function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

   n = length(path); % n = lungimea path-ului

   % matrice de zerouri de n-1 linii (fara starea de win) si 2 coloane 
   decoded_path = zeros(n-1, 2);

   % coloana 1 = indicele liniei
   decoded_path(:, 1) = floor( (path(1:n-1)-1)/cols) + 1;
   % coloana 2 = indicele coloanei
   decoded_path(:, 2) = mod(path(1:n-1) -1, cols) + 1;

end
