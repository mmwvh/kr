0.80::conditions(S, N) :- conditions(S-1, N).
0.10::conditions(S, N+1) :- conditions(S-1, N), N<3.
0.10::conditions(S, N-1) :- conditions(S-1, N), N>0.

evidence(conditions(0, 3)).

query(conditions(1, 2)).
