/*
 nr_aparitii(E,l1...ln)={0,n=0;}
                        {nr_aparitii(E,l2...ln),E!=l1}
                        {1+nr_aparitii(E,l2...ln),E=l1}
model flux(i,i,o,o)
                        */
nr_aparitii(_,[],0,[]).
nr_aparitii(E,[E|T],Rez,L):-nr_aparitii(E,T,Rez_aux,L),Rez is Rez_aux+1.
nr_aparitii(E,[H|T],Rez,[H|L]):- \+E is H,nr_aparitii(E,T,Rez,L).

/*
construct(l1...ln): {[],n=0}
                    {[l1,nr_aparitii(l1...ln) U
                    construct(l2...ln/l1),n>0}

*/
construct([],[]).
construct([H|T],[[H,Atom]|Rez]):-nr_aparitii(H,[H|T],Atom,Newl),construct(Newl,Rez).
