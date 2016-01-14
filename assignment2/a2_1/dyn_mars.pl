life(0).
conditions(0, 3).

calcP(N, P):- N>0, P  is 1-(1/(N+1)).

0.80::conditions(S, N); 
0.10::conditions(S, Np); 
0.10::conditions(S, Nm) :- 
S>0,
Sm is S-1,
conditions(Sm, N),
Nm is N-1, Np is N+1,
N<3, N>0.

P::life(S) :- Sm is S-1, life(Sm), conditions(Sm, N), calcP(N, P).

query(life(1)).
