/*
sublista_aux(l1...ln,a,b,poz): {[],n=0}
                       { l1 U sublista_aux(l1...ln,a,b,poz+1),poz>=a si
                       poz<=b}
                       {sublista_aux(l1...ln,a,b,poz+1),poz<a si
                       poz>b}
suublista_aux(lista,element,element,element,lista)
 sublista_aux(L,A,B,Poz,R).
L-lista initiala
A-poztia de inceput
B-pozitia de final
Poz-pozitia curenta
R-lista rezultat
model flux(i,i,i,i,o).
*/

sublista(L,A,B,Rez):-sublista_aux(L,A,B,1,Rez).

sublista_aux([],_,_,_,[]).
sublista_aux([H|T],A,B,Poz,[H|Rez]):-Poz>=A,Poz=<B,!,Poz1 is Poz+1,sublista_aux(T,A,B,Poz1,Rez).
sublista_aux([_|T],A,B,Poz,Rez):-Poz1 is Poz+1,sublista_aux(T,A,B,Poz1,Rez).
