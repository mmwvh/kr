calcP(P, N) :- N > 0, P = 1-(1/(N+1)).
calcP(P, N) :- P = 0.

P::life(S) :- life(S-1), conditions(S-1, N), calcP(P, N). 

0.80::conditions(S, N) :- conditions(S-1, N).
0.10::conditions(S, N+1) :- conditions(S-1, N), N<3.
0.10::conditions(S, N-1) :- conditions(S-1, N), N>0.

evidence(conditions(0, 3)).

query(conditions(1, 2)).
