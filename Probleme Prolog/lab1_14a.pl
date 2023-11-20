/* exista(l1...ln,E){false,n=0}
                    {true,E,=l1}
                     {exista(l2...ln,E),altfel}
model flux(i,i)
exista(L,E).
L-lista de elemente
E-elementul cautat
*/

exista([E|_],E):-!.
exista([_|T],E):-exista(T,E).

/*existatoate(l1...ln,L1...Lm):{true,n=0}
 *                             {existatoate(l2...ln,L1...Lm),exista(L1...Lm,l1),n>0}
                               {false,altfel}

   model flux (i,i)
   existatoate(L1,L2).
   verifica daca toate elementele din L1 se regasesc in L2
                               */
 existatoate([],_).
 existatoate([H|T],L):-existatoate(T,L),exista(L,H).

  egale(L1,L2):-existatoate(L1,L2),existatoate(L2,L1).
