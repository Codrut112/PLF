/*substituielista(lista,lista,element,lista).
 * substitue(L,Laux,E,Lrez)
 * L-lista initial
 * Laux -lista uc care vom inlocui elementul
 * E-elementul ale carui aparitii le vom inlocui
 * Lrez-lista rezultat
 * substituielista(l1...ln,L,E) {[],n=0}
                               { L U substituielista(l2...ln,L,E)}
                               { l1 U substitielista(l2...ln,L,E)}
 model flux(i,i,i,o)
 */


 substituielista([],_,_,[]).
 substituielista([E|T],L,E,[L|Rez]):-!,substituielista(T,L,E,Rez).
 substituielista([H|T],L,E,[H|Rez]):-substituielista(T,L,E,Rez).
