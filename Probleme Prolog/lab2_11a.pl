%numar_prim(E:element,D:element):
%numar_prim(E,D) {true,D>E/2}
%                {numar_prim(E,D+1),E%D!=0}
%                {false,altfel}

numar_prim(E,D):-T is E div 2, D>T,!.
numar_prim(E,D):-X is E mod D,\+ X is 0, D1 is D+1,numar_prim(E,D1).

prim(E):-E>1,numar_prim(E,2).

%dubl(L:lista,R:lista)
%dubl(l1...ln) {[],n=0}
%              {l1 U dubl(l2...ln),n>0,l1 nu e prim}
%              {l1 U l1 U dubl(l2...ln),n>0,l1 e prim}


dubl([],[]).
dubl([H|T],[H|R]):- \+prim(H),dubl(T,R).
dubl([H|T],[H,H|R]):- prim(H),dubl(T,R).

