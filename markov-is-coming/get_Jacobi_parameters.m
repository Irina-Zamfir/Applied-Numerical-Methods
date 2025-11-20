function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

  % G -> iteration matrix
	% c -> iteration vector

  % n - marimea mat de propabilitati 
  [~, n] = size(Link);

  % G - mat patratica formata din probalitatile dintre starile mat init
  G = Link(1:(n-2), 1:(n-2));
  % c - vectorul format din probabilitatile coloanei starii win 
  c = Link(1:(n-2), n-1);

  % Link este sparsed => G si c vor fi sparsed 

end