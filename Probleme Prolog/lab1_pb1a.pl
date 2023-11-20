/*diferenta(l1...ln,L1...Lm):{[],n=0}
                             {l1 U diferenta(l2..ln,L1...Lm)
                             !exista(l1,L1...Lm),n>0}
                             {diferenta(l2...ln,L1...Lm),exista(l1,L1...Lm  ),n>0}
diferenta(lista,lista,lista)
diferenta(L1,L2,R)
R=L1\L2
model flux(i,i,o)
*/

/*exista(E,l1...ln) {true,E=l1}
 *                   {exista(E,l2...ln),n>0,E!=l1}
 * model flux(i,i)
 */

 exista(E,[E|_]):-!.
 exista(E,[_|T]):-exista(E,T).

diferenta([],_,[]).
diferenta([H|T],L,[H|Rez]):- \+exista(H,L),!,diferenta(T,L,Rez).
diferenta([_|T],L,Rez):-diferenta(T,L,Rez).
