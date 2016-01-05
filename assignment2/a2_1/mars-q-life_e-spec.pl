expert(0.05, 0.10, 0.05).
%expert(0.15, 0.20, 0.15).

measurenut(V).

1.00::process.
X::water :- expert(X,Y,Z).
Y::atmos :- expert(X,Y,Z).
Z::nutri :- expert(X,Y,Z).

0.90::specnut :- nutri, measurenut(V).
0.10::specnut :- \+nutri, measurenut(V).

0.68::geo :- process, water.
0.20::geo :- process, \+water.
0.60::geo :- \+process, water.

0.01::life :- nutri, water, atmos.

0.90::meth :- life.
0.03::meth :- \+life.

0.97::specmeth :- meth.
0.08::specmeth :- \+meth.

evidence(measurenut(a), true).


query(life).
