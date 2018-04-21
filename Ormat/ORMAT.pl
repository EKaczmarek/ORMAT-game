
 
generuj([], 0, []) :- !.
generuj([], N, [N|L]) :- !, 
	N1 is N-1, 
	generuj([], N1, L).
generuj([H|T], N, [H|L]) :- !,
	N1 is N-1, 
	generuj(T, N1, L).


pobierz(X,[X|R],R).  
pobierz(X,[F|R],[F|S]) :-
	pobierz(X,R,S).

perm([X|Y],Z) :- 
	perm(Y,W), 
	pobierz(X,Z,W).  

perm([],[]).

k_comb(K, L, C) :-
	length(L, N),
	length(C, K),
	K =< N,
	k_comb_1(C, L).
	
k_comb_1([], _).
k_comb_1([X|Xs], L) :-
	select(X, L, L0),
	k_comb_1(Xs, L0).

silnia(0,1).
silnia(N,X):-
	N1 is N-1,
	silnia(N1,X1),
	X is N*X1.



start:-
	V is 4,
	% generowanie listy od 1 do V i jej wyświetlenie
 	generuj([],V, W),	
	writeln(W),

	% znalezienie permutacji listy W i ich wyświetlenie
	k_comb(V, W, L),
	writeln(L),

	length(L, Size),
	writeln(Size),

	fail.
start.