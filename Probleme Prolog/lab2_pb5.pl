/*maxim(l1..ln){[l1],n=1}
                 {maxim(l2...ln,l1),maxim(l2...ln)<l1}
                 {maxim(l2...ln),maxim(l2...ln)>l1}
 maxim(L,M)
 L-lista
 M-elementul maxim al listei
 model flux(i,o)
 */
 maxim([E],E).
 maxim([H|T],H):-maxim(T,M),H>M,!.
 maxim([_|T],M):-maxim(T,M).
 /*pozmax(l1...ln,M,Poz) {[],n=0}
                        { Poz U pozmax(l2...ln,M,Poz+1),l1=M}
  *                      {pozmax(l2...ln,M,Poz+1),l1!=M}
  * pozmax(L,M,Poz,R);
  * model flux(i,i,i,o)
  * L-lista initiala
  * M-maximul listei
  * Poz-pozitia curenta in lista
  * R-lista pozitiilor maximului
 */

poz(L,R):-maxim(L,Max),pozmax(L,Max,1,R).

pozmax([],_,_,[]).
pozmax([M|T],M,Poz,[Poz|Rez]):-Poz1 is Poz+1,!,pozmax(T,M,Poz1,Rez).
pozmax([_|T],M,Poz,Rez):-Poz1 is Poz+1,!,pozmax(T,M,Poz1,Rez).
