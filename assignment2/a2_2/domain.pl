0.125::donald(X) ;
0.125::dagobert(X) ;
0.125::katrien(X);
0.125::kwik(X);
0.125::kwek(X);
0.125::kwak(X);
0.125::guus(X);
0.125::oma(X).

0.01::shirt(blauw, X).
0.01::shirt(paars, X).
0.01::shirt(roze, X).
0.01::shirt(rood, X).
0.01::shirt(oranje, X).
0.01::shirt(geel, X).
0.01::shirt(groen, X).
0.01::shirt(wit, X).
0.01::shirt(zwart, X).

0.01::hoed(blauw, X).
0.01::hoed(paars, X).
0.01::hoed(roze, X).
0.01::hoed(rood, X).
0.01::hoed(oranje, X).
0.01::hoed(geel, X).
0.01::hoed(groen, X).
0.01::hoed(wit, X).
0.01::hoed(zwart, X).

0.01::schoen(X).
0.01::slobkous(X).
0.01::strik(X).
0.01::klein(X).
0.01::bril(X).


%kleineKansBril(X).

%0.01::bril(X) :- kleineKansBril(X).
%0.8::bril(X) :- groteKansBril(X).

0.1::strik(X) :- kleineKansStrik(X).
0.8::strik(X) :- groteKansStrik(X).

%no prob 100% since there is always a chance that it is not there.
%there are baby donald and daisy comics but no dagobert or Guus
%
%Donald
0.90::hoed(blauw, X) :- donald(X).
0.99::strik(X) :- donald(X).
0.79::shirt(blauw, X); 0.20::shirt(zwart, X) :- donald(X).
0.05::klein(X) :- donald(X).

%Dagobert
0.90::hoed(zwart, X):- dagobert(X).
0.99::bril(X) :- dagobert(X).
0.79::shirt(rood, X); 0.20::shirt(blauw, X) :- dagobert(X).
0.90::slobkous(X) :- dagobert(X).

%Katrien
0.99::hoed(roze, X) :- katrien(X).
0.99::strik(X) :- katrien(X).
0.79::shirt(roze, X); 0.20::shirt(zwart, X) :-katrien(X).
0.99::shoen(X) :- katrien(X).
0.05::klein(X) :- katrien(X).

%Kwik
0.80::hoed(rood, X) :- kwik(X).
0.79::shirt(rood, X); 0.20::shirt(zwart, X) :- kwik(X).
0.99::klein(X) :-kwik(X).

%Kwek
0.80::hoed(blauw, X) :- kwek(X).
0.79::shirt(blauw, X); 0.20::shirt(zwart, X) :- kwek(X).
0.99::klein(X) :-kwek(X).

%Kwak
0.80::hoed(groen, X) :- kwak(X).
0.80::shirt(groen, X); 0.20::shirt(zwart, X) :- kwak(X).
0.99::klein(X) :-kwak(X).

%Guus Geluk
0.20::hoed(rood, X); 0.79::hoed(groen, X) :- guus(X).
0.99::strik(X) :- guus(X).
0.79::shirt(rood, X); 0.20::shirt(groen, X) :- guus(X).
0.99::slobkous(X) :- guus(X).
0.20::klaver(X) :- guus(X).

%Oma Duck
0.99::bril(X) :- oma(X).
0.89::shirt(zwart, X); 0.10::shirt(paars, X) :- oma(X).
0.99::slobkous(X) :- oma(X).
0.99::schoen(X) :- oma(X).

evidence(shirt(blauw, a)).
%evidence(shirt(blauw, a)).
%evidence(bril(a)).
evidence(slobkous(a)).
%evidence(schoen(a)).
%evidence(hoed(blauw, a)).

query(donald(a)).
query(dagobert(a)).
query(katrien(a)).
query(kwik(a)).
query(kwek(a)).
query(kwak(a)).
query(guus(a)).
query(oma(a)).
%mogelijk lager abstractie niveau: geometrische vormen van bijv strik of bril.
