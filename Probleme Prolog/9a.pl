/*inters(lista,lista,lista)
  inters(l1..ln,L):{[],n=0}
                   {l1 U inters(l2...ln),n>0 este(l1,L)=true}
                   {inters(l2...ln),n>0 este(l1,L)=false}
inters(L1,L2,L3)
L1-prima multime
L2- a doua multime
L3- intersectia multimilor
model flux(i,i,o),(i,i,i)
*/
inters([],_,[]).
inters([H|T],L,[H|Rez]):- este(H,L),!,inters(T,L,Rez).                              inters([_|T],L,Rez):-inters(T,L,Rez).



/* este(Element,lista)
 *  este(E,l1..ln):{ false,n=0}
 *                 { true , E=l1,n>0}
 *                 {este(E,l2..ln),n>0}
 * este(E,L)
 * E-elemtul
 * L-lista in care verificam daca exista elementul
 * model flux(i,i)
 */

 este(E,[E|_]).
 este(E,[_|T]):-este(E,T).
