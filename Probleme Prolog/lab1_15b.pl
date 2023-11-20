/*mininm(L:lista,E:element)
 * minim(l1...ln) {l1,n=1}*/

%                   { l1,l1<minim(l2...ln),n>0}
 %                  {minim(l2...ln),l1>minim(l2...ln)}
 %model flux(i,o)

 minim([A],A).
 minim([H|T],H):-minim(T,R),R>H,!.
 minim([_|T],R):-minim(T,R).

/*sterge_prima_ap(L:lista,E:element,R:lista)
 * sterge_prima_ap(l1...ln,E){ [],n=0}
 *                           { [l2...ln],E=l1,n>0}
 *                           { l1 U
 *                           sterge_prima_ap(l2...ln,E),E!=l1,n>0}
 *model flux(i,i,o).
*/

sterge_prima_ap([],_,[]).
sterge_prima_ap([E|T],E,T):-!.
sterge_prima_ap([H|T],E,[H|R]):-sterge_prima_ap(T,E,R).


sterge_min(L,R):-minim(L,E),sterge_prima_ap(L,E,R).


