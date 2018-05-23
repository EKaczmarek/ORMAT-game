:- use_module(library(clpfd)).

listy(Lst, A,B) :-
	pattern(Lst,A),
	pattern(Lst,B),
	sum2(A, B, Lst),
	label(A), 
	label(B).

listy(Lst, A,B,C) :-
	pattern(Lst,A),
	pattern(Lst,B),
	pattern(Lst,C),
	sum2(A, B, Lst1),
	sum2(C, Lst1, Lst),
	label(A), 
	label(B),
	label(C).

listy(Lst, A,B,C,D) :-
	pattern(Lst,A),
	pattern(Lst,B),
	pattern(Lst,C),
	pattern(Lst,D),
	sum2(A, B, Lst1),
	sum2(C, D, Lst2),
	sum2(Lst1, Lst2, Lst),
	label(A), 
	label(B),
	label(C), 
	label(D).

/*dodawanie macierzy*/
sum2([],[],[]).
sum2([H|T],[H1|T1],[H2|T2]):- 
	H #\= H1,
	H2 is H+H1,
	sum2(T,T1,T2).
sum2([H|T],[H1|T1],[H2|T2]):- 
	H #= H1,
	H2 is H,
	sum2(T,T1,T2).

substract([],[],[]).
substract([H|T],[H1|T1], [H2|T2]):-
	H #\ H1,
	H2 is H-H1,
	substract(T,T1,T2).
substract([H|T],[H1|T1], [H2|T2]):-
	H #= H1,
	H2 is H,
	substract(T,T1,T2).
	
check([H|T], [H1|T1], [H2|T2], [H3|T3], [H4|T4], [H5|T5], [H6|T6]):-
	substract([H|T], [H1|T1], [W0|W1]),
	substract([W0|W1], [H2|T2], [W2|W3]),
	substract([W2|W3], [H3|T3], [W4|W5]),
	substract([W4|W5], [H4|T4], [W6|W7]),
	substract([W6|W7], [H5|T5], [W8|W9]),
	substract([W8|W9], [H6|T6], [0,0,0,0,0,0,0,0,0]).

	
/*Lst np[1,1,1, 1,1,1, 1,1,0 ] , W - mozliwosci patternow*/
pattern(Lst, W):-
	getPatterns(Lst, A),
	zastap(A,K),
	splaszcz(K, W).
	
getPatterns(Lst, Qs):-
	length(Lst, W),
	D is integer(sqrt(W)),
	permutation_clp(D, Qs),
	label(Qs).

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

/*na wejsciu [2,3,1] na wyjsciu [[0,1,0], [0,0,1], [1,0,0]*/
zastap([], []).
zastap([O|T], [R|T2]) :- 
	konw(O,R), 
	zastap(T, T2).


konw(N,[1,0,0]) :- 
	N =:= 1.
konw(N,[0,1,0]) :- 
	N =:= 2.
konw(N,[0,0,1]) :- 
	N =:= 3.

splaszcz([],[]):- !.
splaszcz([H|T], Lst):-
	!,
	splaszcz(H, Nowa1),
	splaszcz(T, Nowa2),
	append(Nowa1, Nowa2, Lst).
splaszcz(Lst,[Lst]).

two_consecutive_ones(Vs) :-
        automaton(Vs, [source(a),sink(c)],
                  [arc(a,0,a), arc(a,1,b),
                   arc(b,0,a), arc(b,1,c),
                   arc(c,0,c), arc(c,1,c)]).
				   
				   


	


