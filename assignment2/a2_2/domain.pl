0.125::donald(X) ;
0.125::dagobert(X) ;
0.125::katrien(X);
0.125::kwik(X);
0.125::kwek(X);
0.125::kwak(X);
0.125::guus(X);
0.125::oma(X).

%Donald
0.90::hoed(blauw, X) :- donald(X).
0.99::strik(X) :- donald(X).
0.80::shirt(blauw, X); 0.20::shirt(zwart, X) :- donald(X).
0.05::klein(X) :- donald(X).

%Dagobert
0.80::hoed(zwart, X) :- dagobert(X).
0.99::bril(X) :- dagobert(X).
0.70::shirt(rood, X); 0.30::shirt(blauw, X) :- dagobert(X).
0.90::slobkous(X) :- dagobert(X).

%Katrien
0.99::hoed(roze, X) :- katrien(X).
0.99::strik(X) :- katrien(X).
0.80::shirt(roze, X); 0.20::shirt(zwart, X) :-katrien(X).
0.99::shoen(X) :- katrien(X).
0.05::klein(X) :- katrien(X).

%Kwik
0.90::hoed(rood, X) :- kwik(X).
0.75::shirt(rood, X); 0.20::shirt(zwart, X) :- kwik(X).
0.99::klein(X) :-kwik(X).

%Kwek
0.90::hoed(blauw, X) :- kwek(X).
0.75::shirt(blauw, X); 0.20::shirt(zwart, X) :- kwek(X).
0.99::klein(X) :-kwek(X).

%Kwak
0.90::hoed(groen, X) :- kwak(X).
0.75::shirt(groen, X); 0.20::shirt(zwart, X) :- kwak(X).
0.99::klein(X) :-kwak(X).

%Guus Geluk
0.20::hoed(rood, X); 0.80::hoed(groen, X) :- guus(X).
0.99::strik(X) :- guus(X).
0.80::shirt(rood, X); 0.20::shirt(groen, X) :- guus(X).
0.99::slobkous(X) :- guus(X).
0.20::klaver(X) :- guus(X).

%Oma Duck
0.99::bril(X) :- oma(X).
0.90::shirt(zwart, X); 0.10::shirt(paars, X) :- oma(X).
0.99::slobkous(X) :- oma(X).
0.99::schoen(X) :- oma(X).

evidence(shirt(groen, a)).

query(donald(a)).
query(dagobert(a)).
query(katrien(a)).
query(kwik(a)).
query(kwek(a)).
query(kwak(a)).
query(guus(a)).
query(oma(a)).

%mogelijk lager abstractie niveau: geometrische vormen van bijv strik of bril.
