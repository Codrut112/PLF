/* suma(l1..ln,F) {0,n=0}
 *                {l1+ suma(l2...ln,1),n>0,F=0}
 *                {-l1+suma(l2...ln,0),n>0,F=1}
 * suma(L,F,S)
 * L-lista initiala
 * F-flag
 * S-suma
 */

  sum(L,R):-suma(L,0,R).
  suma([],_,0).
  suma([H|T],0,R):-suma(T,1,Aux),R is Aux+H.
  suma([H|T],1,R):-suma(T,0,Aux),R is Aux-H.


