% candidat(N:integer, I:integer)
% (i,o) - nedeterminist
candidat(N, N).
candidat(N, I) :-
N>1,
N1 is N-1,
candidat(N1,I).
% permutari(N:integer, V:integer, L:list)
% (i,i,o) - nedeterminist
permutari(N, V, L) :-
candidat(N, I),
permutari_aux(N, V, L, 1, [I]).
% permutari_aux(N:integer, V:integer, L:list, Lg:integer, Col:list)
% (i,i,o,i,i) - nedeterminist
permutari_aux(N, _, Col, N, Col) :- !.
permutari_aux(N, V, L, Lg, [H|T]) :-
candidat(N, I),
abs(H-I)>=V,
\+ apare(I, [H|T]), % (i,i)
Lg1 is Lg+1,
permutari_aux(N, V, L, Lg1, [I|[H|T]]).
