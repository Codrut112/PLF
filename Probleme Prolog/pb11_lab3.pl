
numar_prim(X):- \+ nueprim(X,2),X>1.
nueprim(X,E):-E<X,D is X mod E,D is 0,!.
nueprim(X,E):-E<X,E1 is E+1,nueprim(X,E1).

dubla([],[]).
dubla([H|T],[H|Lrez]):- \+numar_prim(H),dubla(T,Lrez).
dubla([H|T],[H,H|Lrez]):- numar_prim(H),dubla(T,Lrez).
