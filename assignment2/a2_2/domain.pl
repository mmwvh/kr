0.333::donald(X) ;
0.333::dagobert(X) ;
0.333::katrien(X).

%Donald
0.90::hoed(blauw, X) :- donald(X).
0.99::strik(X) :- donald(X).
0.95::shirt(blauw, X) :- donald(X).
0.05::shirt(zwart, X) :- donald(X).

%Dagobert
0.80::hoed(zwart, X) :- dagobert(X).
0.99::bril(X) :- dagobert(X).
0.70::shirt(rood, X) :- dagobert(X).
0.30::shirt(blauw, X) :- dagobert(X).
0.90::slobkous(X) :- dagobert(X).

%Katrien
0.99::hoed(roze, X) :- katrien(X).
0.99::strik(X) :- katrien(X).
0.80::shirt(roze, X) :- katrien(X).
0.20::shirt(zwart, X) :-katrien(X).
0.99::shoen(X) :- katrien(X).

evidence(shirt(blauw, a)).

query(donald(a)).
query(dagobert(a)).
query(katrien(a)).

%mogelijk lager abstractie niveau: geometrische vormen van bijv strik of bril.
