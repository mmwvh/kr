1.00::process.
0.05::water.
0.10::atmos.
0.05::nutri.

0.90::specnut :- nutri.
0.10::specnut :- \+nutri.

0.68::geo :- process, water.
0.20::geo :- process, \+water.
0.60::geo :- \+process, water.

0.01::life :- nutri, water, atmos.

0.90::meth :- life.
0.03::meth :- \+life.

0.97::specmeth :- meth.
0.08::specmeth :- \+meth.

query(geo).
