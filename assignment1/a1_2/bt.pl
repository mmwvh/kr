leaf(0).

node(X, Y, L).

isBT(T) :-
	T = leaf(0) ;
	T = node(L, R,_),
	isBT(L), isBT(R)
.

nnodes(nil, 0).
nnodes(leaf(0), 1).
nnodes(T, N) :-
	isBT(T),
	T = node(L, R,_),
	nnodes(L, NL), nnodes(R, NR),
	N is NL + NR + 1
. 

makeBT(0, leaf(0)).
makeBT(N, T) :-
	NL is N - 1, NR is N - 1,
	makeBT(NL, TL), makeBT(NR, TR),
	T  = node(N, TL, TR) 
.
