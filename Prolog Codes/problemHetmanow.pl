queens8(W):-
	queens8(W,[],[1,2,3,4,5,6,7,8]).
queens8([],_,[]).
queens8([H|Rest],Cl,Op):-
	select(H,Op,NewOp), % usuń H z listy Op
	noattack(H,Cl,1),
	queens8(Rest,[H|Cl],NewOp).

permut([],[]).
permut([E|Perm],L):- select(E,L,RL), % usuń E z listy L
	permut(Perm,RL).

safe([]).
	safe([Q|Rest]):- noattack(Q,Rest,1), safe(Rest).

noattack(_,[],_).
noattack(Q,[H|Rest],N):- Q =\= H-N, Q =\= H+N,
	N1 is N+1, noattack(Q,Rest,N1).



start:-
	queens8([1,2,3,5,4,6,8,7]),
	fail.
start.