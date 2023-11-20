/*PB14
subm(lista,Element,lista)-gaseste toate submultimile cu suma ceruta
subm(L,S,COL)
L-lista initiala din care alegem elemente
S-suma
COL-submultime a caror elemente are suma S
subm(l1...ln,S){ [l1], l1=S ,n>0 }
               1.subm(l2...ln,S),n>0
               2.l1 U subm(l2...ln,S-l1),n>0,l1<S
(i,i,o)-model flux
*/
subm([H|_], H, [H]).
subm([_|T], S, C):-subm(T, S, C).
subm([H|T], S,[H|COL]) :-
S1 is S-H,
S1>0,
subm(T,S1,COL).

/*
toatesubm(lista,Element,lista)- genereaza lista submultimilor de suma S
data,cu elementele listei L
toatesubm(L,S,REZ)
L-lista initiala
S-suma
REZ-lista in care retinem toate submultimile
toatesubm(L,S){subm(l1...ln,S)}
(i,i,o)-model flux
toatesubm(lista,Element,lista){findall(subm(L,S))}
*/
toatesubm(L, S, REZ) :-
findall(Colector, subm(L, S, Colector), REZ).
