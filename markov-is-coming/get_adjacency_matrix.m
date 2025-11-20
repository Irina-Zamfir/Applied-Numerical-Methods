function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  [lin, col] = size(Labyrinth);
  n = lin*col + 2;
  win = n - 1;
  lose = n;

  % fac mat de adiacenta si setez starile pt win si lose
  Adj = zeros(n);
  Adj(win, win) = 1;
  Adj(lose, lose) = 1;

  % folosind 2 foruri verific fiecare element din matricea initiala
  for i = 1:lin
    for j = 1:col

      nr = Labyrinth(i, j);
      s1 = (i-1)*col + j; % calc starea 1 

      % daca nu am zid in nord calculez starea 2 si completez elementul
        % din matricea de adiacenta; daca sunt pe prima linie, completez pt
        % starea de win
      bit_value = bitget(nr, 4);
      if bit_value == 0
        if i-1 == 0
          Adj(s1, win) = 1;
        else
          s2 = (i-2)*col +j;
          Adj(s1, s2) = 1;
        endif
      endif

      % daca nu am zid in sud calculez starea 2 si completez elementul
        % din matricea de adiacenta; daca sunt pe ultima linie, completez
        % pt starea de win
      bit_value = bitget(nr, 3);
      if bit_value == 0
        if i+1 == lin+1
          Adj(s1, win) = 1;
        else
          s2 = i*col +j;
          Adj(s1, s2) = 1;
        endif
      endif

      % daca nu am zid in vest calculez starea 2 si completez elementul
        % din matricea de adiacenta; daca sunt pe prima coloana, completez pt
        % starea de lose
      bit_value = bitget(nr, 2);
      if bit_value == 0
        if j == col
          Adj(s1, lose) = 1;
        else
          s2 = (i-1)*col + (j+1);
          Adj(s1, s2) = 1;
        endif
      endif

      % daca nu am zid in est calculez starea 2 si completez elementul
        % din matricea de adiacenta; daca sunt pe ult coloana, completez pt
        % starea de lose
      bit_value = bitget(nr, 1);
      if bit_value == 0
        if j == 1
          Adj(s1, lose) = 1;
        else
          s2 = (i-1)*col + (j-1);
          Adj(s1, s2) = 1;
        endif
      endif

    endfor
  endfor

  % fac matricea de adiacenta sparse 
  Adj = sparse(Adj);

end