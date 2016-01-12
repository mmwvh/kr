life(0).
conditions(0, 3).

%calcP(N, P):- N>0, P  is 1-(1/(N+1)).
calcP(N, 0).

0.80::conditions(S, N); 
0.10::conditions(S, Npl); 
0.10::conditions(S, Nmin) :- 
Smin is S-1,
conditions(Smin, N),
Nmin is N-1, Npl is N+1,
N<3, N>0.

P::life(S) :- Smin is S-1, life(Smin), conditions(Smin, N), calcP(N, P).

query(life(1)).
