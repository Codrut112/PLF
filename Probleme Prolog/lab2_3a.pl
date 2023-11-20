%plaseaza(L:lista,E:element,R:lista rezulatat)
%plaseaza(l1...ln,E)  {[E],n=0}
%                     {l1 U plaseaza(l2...ln,E),E>l1,n>0}
%                     {E U [l1...ln],E<l1,n>0}
%                     {[l1...ln],E=l1}
% model flux(i,i,o)

plaseaza([],E,[E]).
plaseaza([H|T],E,[H|R]):-E>H,!,plaseaza(T,E,R).
plaseaza([H|T],E,[E,H|T]):-E<H.
plaseaza([H|T],E,[H|T]):-E is H.

%sorteaza(L:lista,R:lista)
%L-lista initiala
%R-lista sortata cu eliminarea dublurilor
%sorteaza(l1...ln){[],n=0}
%       {plaseaza(sorteaza(l2...ln,E),n>0}
%       model flux(i,o).

sorteaza([],[]).
sorteaza([H|T],R):-sorteaza(T,R_aux),plaseaza(R_aux,H,R).
