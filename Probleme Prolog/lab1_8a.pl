/*
multime(lista)
multime(L)
mutime(l1...ln){true,n=0}
               {nuexista(l1,l2...ln) U multime(l2...ln)}

model flux(i)
*/

/*
nuexista(element,lista)
nuexista(E,L)
E-elementul cautat
L-lista in care verificaam daca nu exista elementul
model flux(i,i).
*/

nuexista(_,[]):-!.
nuexista(E,[H|T]):- E\=H,nuexista(E,T).
multime([]).
multime([H|T]):-nuexista(H,T),multime(T).

