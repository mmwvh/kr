node([], leaf).
node(X, Label).

nnodes(node([],leaf), 1).
nnodes(node(X, _), N) :-
	X = [T|Ts],
	nnodes(T, NT), ntree(Ts, NTs),
	N is NT + NTs + 1
.

ntree([], 0). 
ntree(X, N) :-
        X = [T|Ts],
        nnodes(T, NT), ntree(Ts, NTs),
        N is NT + NTs
.

