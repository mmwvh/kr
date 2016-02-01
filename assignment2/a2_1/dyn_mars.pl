%Dynamic Mars mission queries microbial life(S) for S=1,2,5

%A priori
life(0).
conditions(0, 3).

%Calculates P of life(S) given life(Smin) 
%and conditions(Smin, N)
calcP(N, P):- N>0, P  is 1-(1/(N+1)).

%lower bound of n
bound0(0, 0).
bound0(N, Nnew) :- N>0, Nnew is N-1.

%upper bound of n
bound3(3, 3).
bound3(N, Nnew) :- N<3, Nnew is N+1.

%Calculates N
0.80::conditions(S, N); 
0.10::conditions(S, Npl); 
0.10::conditions(S, Nmin) :- 
S>0,
Smin is S-1,
conditions(Smin, N),
bound0(N, Nmin),
bound3(N, Npl).

P::life(S) :- S>0, Smin is S-1, life(Smin), conditions(Smin, N), calcP(N, P).

query(life(1)).
query(life(2)).
query(life(5)).
