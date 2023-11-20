/*
 * sust(L,E1,E2,R)
subst(lista,element,element,lista)
subst(l1..ln,E1,E2):{[],n=0}
                              {l1 U subst(l2...ln,E1,E2),n>0,l1!=E}
                              {E2 U subst(l2...ln,E1,E2),n>0,l1=E}

model flux(i,i,i,o)

*/

subst([],_,_,[]).
subst([H|T],E1,E2,[H|Rez]):-E1\=H,subst(T,E1,E2,Rez).
subst([E1|T],E1,E2,[E2|Rez]):-subst(T,E1,E2,Rez).

