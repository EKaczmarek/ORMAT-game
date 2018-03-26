
 
generuj([], 0, []) :- !.
generuj([], N, [N|L]) :- !, 
	N1 is N-1, 
	generuj([], N1, L).
generuj([H|T], N, [H|L]) :- !,
	N1 is N-1, 
	generuj(T, N1, L).


start:-
	generuj([],3, W),
	writeln(W),
	fail.
start.