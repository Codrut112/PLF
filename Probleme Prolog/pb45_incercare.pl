mai_mare([],[]):-!.
mai_mare([_|_],[]):-!.
mai_mare([_|T1],[_|T2]):-mai_mare(T1,T2).


secv_pare([H|T],[H|Rez],E):-H=:=E+2,D is H mod 2,D = 0,!,secv_pare(T,Rez,H).
secv_pare(_,[],_).

secv_compar([],[]).
secv_compar([H|T],Pare):-secv_compar(T,Rez),E is H-2,secv_pare([H|T],Pare,E),mai_mare(Pare,Rez),!.
secv_compar([_|T],Rez):-secv_compar(T,Rez).
