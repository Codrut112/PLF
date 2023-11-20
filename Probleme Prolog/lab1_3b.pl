/*adauga_lista(l1...ln,f)  { [],n=0  }
 *                         { l1 U adauga_lista(l2...ln,f),l1%2==f,n>0}
 *                         {adauga_lista(l2...ln,f),l1%2!=f,n>0}
 *  adauga_lista(lista,element,lista)
 *  adauga_lista(L,F,R)
 *  L-lista initiala
 *  F-flag de paritate
 *  R -lista de elemente pare/impare
 model flux(i,i,0)
 */
 adauga_lista([],_,[]).
 adauga_lista([H|T],F,[H|Rez]):- D is H mod 2, D is F,!,adauga_lista(T,F,Rez).
 adauga_lista([_|T],F,Rez):-adauga_lista(T,F,Rez).

 lista(L,[R1,R2],X,Y):-adauga_lista(L,0,R1),adauga_lista(L,1,R2),numar_elemente(R1,X),numar_elemente(R2,Y).

 /*numar elemente(L:lista initiala,E:numarul de elemente din lista)
  * numar_elemetnte(l1...ln) { 0,n=0}
  *                          {1 + numar_elemente(l2...n)}
  *
  *model flux(i,o)
  */
  numar_elemente([],0).
  numar_elemente([_|T],N1):- numar_elemente(T,N),N1 is N+1.

