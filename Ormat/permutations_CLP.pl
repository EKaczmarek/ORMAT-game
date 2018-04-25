:- use_module(library(clpfd)).

getPatterns(Lst, Qs):-
	/*Lst np[1,1,1, 1,1,1, 1,1,0 ]*/
	length(Lst, W),
	D is integer(sqrt(W)),
	permutation_clp(D, Qs).

permutation_clp(N, Qs) :-
	length(Qs, N),
	Qs ins 1..N,
	find_p(Qs).

find_p([]).
find_p([Q|Qs]) :- 
	find_p(Qs, Q, 1), 
	find_p(Qs).

find_p([], _, _).
find_p([Q|Qs], Q0, D0) :-
	Q0 #\= Q,
	D1 #= D0 + 1,
	find_p(Qs, Q0, D1).
	
	
/*Wywołanie ?-n_queens(4, Qs), label(Qs).*/


