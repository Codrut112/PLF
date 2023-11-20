/*PB6
 * concat(lista,lista,lista) -adauga la sfarsitul celei de-a
 * doua liste prima lista
 * concat(L1,L2,Lrez)
 * L1-prima lista
 * L2- a doua lista
 * Lrez= L2 U L1
 *
 * concat(l1..ln,L1..Lm) { [] ,n=0 ,m=0}
 *                       { L1..Lm, n=0,m>0
 *                       { L1 U concat(l1..ln,L2...Lm , m,n>0}
 *                       { l1 U concat(l2...ln,L1...Lm),m=0,n>0}
 * (i,i,o)-model flux*/
concat([],[],[]):-!.
concat([],L,L):-!.
concat([H1|T1],[H2|T2],[H2|Rez]):-concat([H1|T1],T2,Rez).
concat([H|T],[],[H|Rez]):-concat(T,[],Rez).


/* inloc(list,Element,lista,lista)
 *inloc(L1,E,L2,Lrez)
 *L1-lista initiala
 *E-elementul pe care il vom inlocui cu L2 (fiecare aparitie)
 *L2- lista cu care vom inlocui aparitiile lui E
 *Lrez-lista rezultat
 *inloc(l1..ln,E,L) { [] ,n=0 }
 *                  { l1 U inloc(l2...ln,E,L),n>0,l1!=E }
 *                  { concat(inloc(l2,..ln,E,L),L),N>0,L1=e }
 *(i,i,i,o)-model flux
*/
inloc([],_,_,[]).
inloc([H|T],E,L,[H|Rez]):-H\=E,!,inloc(T,E,L,Rez).
inloc([E|T],E,L,Rez):-inloc(T,E,L,Rez_aux),concat(Rez_aux,L,Rez).


/*intoarce primul element dintr-o lista
 * first_element(list,element)
 * first_element(L,E)
 * L-lista
 * E-primul element
 * first_element(l1...ln){[],n=0}
 *                        {l1,n>0}
 * (i,o)-model flux
 *
*/
first_element([],[]).
first_element([H|_],H).



/*Se da o lista eterogena, formata din numere intregi si liste de numere
intregi. In fiecare sublista sa se inlocuiasca toate aparitiile primului
element din sublista cu o lista data.
*
 *inloc_power(lista,lista,lista)
 *inloc_power(L,L_aux,Lrez)
 *L-lista initiala
 *L_aux-lista care va inlocui elementele
 *Lrez-lista rezultat
 *inloc_power(l1...ln,L) { [] ,n=0}
 *                       { l1 U inloc_power(l2...ln,L),n>0,l1 nu e
 *                       lista}
 *                       {inloc(l1,l1[1],L)
 *                       U inloc_power(l2...ln,L),n>0,l1 este lista }
 *
 *(i,i,o)-model flux
*/
inloc_power([],_,[]).
inloc_power([H|T],L,[H|Rez]):- \+is_list(H),!,inloc_power(T,L,Rez).
inloc_power([H|T],L,[NewL|Rez]):-
    is_list(H),
    inloc_power(T,L,Rez),
    first_element(H,E),
    inloc(H,E,L,NewL).

