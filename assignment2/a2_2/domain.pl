%Donald Duck domein

%A priori
0.16::donald(X) ;
0.12::dagobert(X) ;
0.12::katrien(X);
0.12::kwik(X);
0.12::kwek(X);
0.12::kwak(X);
0.12::guus(X);
0.12::oma(X).

%A priori
0.05::shirt(blauw, X).
0.05::shirt(paars, X).
0.05::shirt(roze, X).
0.05::shirt(rood, X).
0.05::shirt(oranje, X).
0.05::shirt(geel, X).
0.05::shirt(groen, X).
0.05::shirt(wit, X).
0.05::shirt(zwart, X).

%A priori
0.05::hoed(blauw, X).
0.05::hoed(paars, X).
0.05::hoed(roze, X).
0.05::hoed(rood, X).
0.05::hoed(oranje, X).
0.05::hoed(geel, X).
0.05::hoed(groen, X).
0.05::hoed(wit, X).
0.05::hoed(zwart, X).

%A priori
0.01::schoen(X).
0.01::slobkous(X).
0.01::strik(X).
0.01::klein(X).
0.01::bril(X).

% Kansen van characters gebaseerd op schatting n.a.v. image search op Google
% Nooit een kans van 1.0 omdat dit niet realistisch is

%Donald
0.90::hoed(blauw, X) :- donald(X).
0.99::strik(X) :- donald(X).
0.79::shirt(blauw, X); 0.20::shirt(zwart, X) :- donald(X).
0.05::klein(X) :- donald(X).

%Dagobert
0.80::hoed(zwart, X):- dagobert(X).
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
0.20::hoed(rood, X); 0.70::hoed(groen, X) :- guus(X).
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

query(donald(a)).
query(dagobert(a)).
query(katrien(a)).
query(kwik(a)).
query(kwek(a)).
query(kwak(a)).
query(guus(a)).
query(oma(a)).
