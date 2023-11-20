/*construct(l1...ln)={[],n=1}
 *
  {concat(perechi(l1,l2...ln),construct(l2...ln)),n>0}

 * construct(lista,lista)
 * construct(L,REZ)
 * L-lista primita
 * REZ-lista perechilor
 * model flux(i,o);
*/
 construct([_],[]):-!.
 construct([H|T],Rezultat):-construct(T,REZ),perechi(H,T,Rez_aux),concat(Rez_aux,REZ,Rezultat).

/*perechi(E,l1..ln)={[E,l1],n=1}
 *                  {[E,l1] U perechi(E,l2...ln),n>0}
 * perechi(E,L,REZ)
 * model flux(i,i,o)
 */

 perechi(_,[],[]):-!.
 perechi(E,[H|T],[[E,H]|REZ]):-perechi(E,T,REZ).

/*
concat(l1..ln,L1..Lm)={[],n=0,m=0}
                     {l1 U concat(l2..ln,L1...Lm),n>0,m>0}
                     {L1 U concat(l1...ln,L1...Lm),n=0,m>0}

                     concat(L1,L2,Rez)
                     model flux(i,i,0)

  */

concat([],[],[]).
concat([H|T],L,[H|Rez]):-concat(T,L,Rez).
concat([],[H|T],[H|Rez]):-concat([],T,Rez).
