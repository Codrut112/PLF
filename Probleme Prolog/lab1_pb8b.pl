/*pb8_aux(lista,element,element)
 * pb8_aux(l1...ln,E,Count);-{[],n=0}
 *                       {[l1...ln],Count=0,n>0}
 *                       {pb8(l2...ln,E,Count-1),n>0,l1==E,Count>0}
 *                       {l1 U pb8(l2...ln,E,Count),n>0,l1!=E}
 * model flux(i,i,i,o)
*/

%pb8(L,E) {pb8_aux(L,E,3).}

pb8(L,E,R):-pb8_aux(L,E,3,R).
pb8_aux([],_,_,[]).
pb8_aux([E|T],E,Count,Rez):-Count>0, Count1 is Count-1,!,pb8_aux(T,E,Count1,Rez).
pb8_aux([H|T],E,Count,[H|Rez]):-pb8_aux(T,E,Count,Rez).

