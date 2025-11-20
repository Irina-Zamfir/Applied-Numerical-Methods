function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

	[~, n] = size(G);
	x = x0; % initializez x cu solutia initiala 

	for steps = 1 : max_steps
   
		% calculez solutia pasului curent 
		x = G*x0 + c;

		% caulculez eroarea
			% daca eroarea este mai mica decat toleranta, ies din loop
		err = norm(x - x0, 2);
    	if err < tol
    		break;
    	endif
    
		% solutia curenta devine solutia precendenta 
    	x0 = x;

  	endfor

end