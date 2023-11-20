listlen(L, N) :- listacc(L, 0, N).
listacc([], A, A).
listacc([_|T], A, N) :- A1 is A+1, listacc(T, A1, N).
