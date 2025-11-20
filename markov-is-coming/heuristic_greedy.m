function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	% path -> the states chosen by the algorithm

  % pun in vectorul de stari, starea de start 
  path = [start_position];
  n = length(probabilities);

  % fac un vector logic de false, coresp numarului de stari
  visited = false(1,n);
  visited(start_position) = true; % fac prima stare true 

  while ~isempty(path)

    % iau ultima stare adaugata 
    poz = path(end);

    % daca probabilitatea de castig a starii este 1, ies din bucla
    if probabilities(poz) == 1
      break;
    endif

    % gasesc vecinii nevizitati starii curente 
    neigh = find(Adj(poz, :) & ~visited);

    % daca nu gasesc niciun vecin, sterg starea din vectorul path 
    if isempty(neigh)
      path(end) = [];
    else
      % altfel
        % gasesc vecinul cu probabilitate maxima de castig 
      [~, idx] = max(probabilities(neigh));

      % marchez vecinul gasit ca vizitat in vectorul logic
      next_poz = neigh(idx);
      visited(next_poz) = true;
      % adaug vecinul in vectorul path 
      path = [path, next_poz];
    endif
  endwhile

end