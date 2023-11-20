/*
sterge_aux(l1...ln,L1...Ln):{[] ,n=0}
               { l1 U sterge_aux(l2...ln), nr_aparitii(l1,L1...Ln)>1}
               { sterge_aux(l2...ln), se repeta=false}

sterge_aux(lista,lista,lista)
sterge_aux(L,Lint,R)
model de flux(i,i,o)
               */
sterge(L,R):-sterge_aux(L,L,R).

sterge_aux([],_,[]).
sterge_aux([H|T],L,[H|Rez]):-nr_aparitii(H,L,Count),Count is 1,sterge_aux(T,L,Rez).
sterge_aux([H|T],L,Rez):-nr_aparitii(H,L,Count),Count > 1,sterge_aux(T,L,Rez).







/* nr_aparitii(E,l1...ln): { 0,n=0}
                           { 1+nr_apartitii(E,l2...ln),E=l1}
                           { nr_apartitii(E,l2...ln),E!=l1}
nr_apritii(E,L,Count).
E-elelementul cauta
L-lista in care cautam elementul
Count -numarul de aparitii
model flux(i,i,o).
*/

nr_aparitii(_,[],0).
nr_aparitii(E,[E|T],Count1):-!, nr_aparitii(E,T,Count),Count1 is Count+1.
nr_aparitii(E,[_|T],Count):-nr_aparitii(E,T,Count).
