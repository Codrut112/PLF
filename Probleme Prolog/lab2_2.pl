/*sort(l1...ln){[],n=0}
               {plaseaza(l1,sort(l2...ln),n>0}
sort(L,R);
model flux(i,o).
               */

/*plaseaza(E,l1...ln)  { [E] ,n=0}
                        {l1 U plaseaza(E,l2...ln),l1<E}
                        {E U [l1...ln],l1>=E}
model flux(i,i,o)
plaseaza(E,L,R)*/


plaseaza(E,[],[E]).
plaseaza(E,[H|T],[H|R]):-E>H,plaseaza(E,T,R).
plaseaza(E,[H|T],[E,H|T]):-E=<H.

sorte([],[]).
sorte([H|T],Rez):-sorte(T,Rez_aux),plaseaza(H,Rez_aux,Rez).
