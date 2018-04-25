:- use_module(library(clpfd)).

getPatterns(Lst, Qs):-
	/*Lst np[1,1,1, 1,1,1, 1,1,0 ]*/
	length(Lst, W),
	D is integer(sqrt(W)),
	permutation_clp(D, E),
	zastap(E, Qs).


zastap([], []).
zastap([O|T], [R|T2]) :- 
	konw(O,R), 
	zastap(T, T2).

konw(N,[1,0,0]) :- N =:= 1.
konw(N,[0,1,0]) :- N =:= 2.
konw(N,[0,0,1]) :- N =:= 3.

/*na wejsciu [2,3,1] na wyjsciu [0,1,0, 0,0,1, 1,0,0]*/
getMatrix([],_).
getMatrix([H|T], Q):-
	get(H,Q),
	getMatrix(T,Q).
	

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

start:-
	getMatrix([1,2,3], Q),
	print(Q),
	fail.
start.

