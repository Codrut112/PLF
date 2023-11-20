/*
  invers_aux(l1...ln,col)= {[],n=0}
                   {invers(l2..ln,l1+col) U l1,n>0}

 *invers(L,Col,R).
 *invers(lista,lista,lista)
 *L-lista initiala
 *Col-lista colectoare
 *R-lista in care se retine rezultatul
 *model de flux(i,i,o)
 */


 invers(L,R):-invers_aux(L,[],R).
 invers_aux([],Col,Col).
 invers_aux([H|T],Col,R):-invers_aux(T,[H|Col],R).
/*
  predecesor(l1...ln,F):{[],l1=1,F=1}
                        {[l1...ln],F=0,n>0}
                       { l1-F U [l2...ln],l1>0,F=1}
                      { 9 U predecesor(l2...ln,1),l1=0,F=1}

   predeceosr(L,F,R)
  L-lista initiala
  R- predecesorl invers
 */
 pred(L,Rez):-invers(L,Li),predecesor(Li,1,Rez_aux),invers(Rez_aux,Rez).
 predecesor([1],1,[]):-!.
 predecesor([H|T],1,[9|Rez]):-H is 0,predecesor(T,1,Rez),!.
 predecesor([H|T],1,[H1|T]):-H>0,H1 is H-1,!.
 predecesor(T,0,T):-!.














