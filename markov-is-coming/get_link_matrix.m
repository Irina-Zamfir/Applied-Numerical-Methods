function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  [lin, col] = size(Labyrinth);
  n = lin*col + 2;
  win = n - 1;
  lose = n;

  % fac mat de probabilitati si setez prob pt starile de win si lose
  Link = zeros(n);
  Link(win, win) = 1;
  Link(lose, lose) = 1;

  % folosind 2 foruri verific fiecare element din matricea initiala
  for i = 1:lin
    for j = 1:col

      nr = Labyrinth(i, j);

      % calculez numarul de stari in care se poate trece
        % daca celula are doar ziduri sar peste element 
      p = 0;
      for pos = 1:4
        p = p + (1 - bitget(nr, pos));
      endfor
      if p == 0
        continue;
      endif


      s1 = (i-1)*col + j; % calc starea 1 

      % daca nu am zid in nord calculez starea 2 si completez elementul
        % din matricea de probabilitati cu 1/(nr de stari); daca sunt pe
        % prima linie, completez pt starea de win
      bit_value = bitget(nr, 4);
      if bit_value == 0
        if i-1 == 0
          Link(s1, win) = 1/p;
        else
          s2 = (i-2)*col +j;
          Link(s1, s2) = 1/p;
        endif
      endif

      % daca nu am zid in sud calculez starea 2 si completez elementul
        % din matricea de probabilitati cu 1/(nr de stari); daca sunt pe
        % ultima linie, completez pt starea de win
      bit_value = bitget(nr, 3);
      if bit_value == 0
        if i+1 == lin+1
          Link(s1, win) = 1/p;
        else
          s2 = i*col +j;
          Link(s1, s2) = 1/p;
        endif
      endif

      % daca nu am zid in vest calculez starea 2 si completez elementul
        % din matricea de probabilitati cu 1/(nr de stari); daca sunt pe
        % prima coloana, completez pt starea de lose
      bit_value = bitget(nr, 2);
      if bit_value == 0
        if j+1 == col+1
          Link(s1, lose) = 1/p;
        else
          s2 = (i-1)*col + (j+1);
          Link(s1, s2) = 1/p;
        endif
      endif

      % daca nu am zid in est calculez starea 2 si completez elementul
        % din matricea de probabilitati cu 1/(nr de stari); daca sunt pe
        % ultima coloana, completez pt starea de lose
      bit_value = bitget(nr, 1);
      if bit_value == 0
        if j-1 == 0
          Link(s1, lose) = 1/p;
        else
          s2 = (i-1)*col + (j-1);
          Link(s1, s2) = 1/p;
        endif
      endif

    endfor
  endfor

  % fac matricea de probabilitai sparse 
  Link = sparse(Link);

end