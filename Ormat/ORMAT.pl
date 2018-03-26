
 
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

silnia(0,1).
silnia(N,X):-
	N1 is N-1,
	silnia(N1,X1),
	X is N*X1.


start:-
	V is 5,
	% generowanie listy od 1 do V i jej wyświetlenie
 	generuj([],V, W),	
	writeln(W),

	% znalezienie permutacji listy W i ich wyświetlenie
	perm(W, X),
	writeln(X),	

	% ilość permutacji obliczona 
	silnia(V, Y),
	write('Ilosc permutacji:'),	
	writeln(Y),

	% ilość permutacji -> długość listy X
	write('Długosc listy:'),	
	%TO DO - ilość permutacji X czymkolwiek to jest (listą/termem)
	fail.
start.