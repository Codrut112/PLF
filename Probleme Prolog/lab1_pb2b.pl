 /*
 * adauga_aux(lista,element,element,element)
 * adauga_aux(L,E,curr,poz,Rez).
 * L-lista pe care lucram
 * E-elementul de inserat
 * curr- pozitia curenta
 * poz-pozitia dupa care trebuie sa adaugam
 * adauga_aux(l1...ln,E,curr,poz) {[],n=0}
 *                                {l1+ adauga_aux(l2...ln,E,curr+1,poz)}
 *                                {E +
 *                                adauga_aux(l1...lb,E,curr+1,2*poz+1)
 *   model flux(i,i,i,i,o).
 */

 adauga_aux([],_,_,_,[]).
adauga_aux([H|T],E,Curr,Poz,[H|Rez]):-Curr\=Poz,Curr1 is Curr+1,adauga_aux(T,E,Curr1,Poz,Rez).
adauga_aux(L,E,Curr,Poz,[E|Rez]):-Curr==Poz,Poz1 is 2*Poz,adauga_aux(L,E,Curr,Poz1,Rez).

adauga(L,E,Rez):-adauga_aux(L,E,0,1,Rez).
