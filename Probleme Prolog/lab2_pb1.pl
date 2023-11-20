/* invers(l1...ln)={[],n=0}
                   {invers(l1...ln) U l1,n>0}
*/

invers(L,Rez):-invers_aux(L,[],Rez).

invers_aux([],Col,Col).
invers_aux([H|T],Col,Rez):-invers_aux(T,[H|Col],Rez),!.

/*
 suma(l1...ln,L1...Lm): {leam scris pe foaie}
*/

suma(L1,L2,Rez):-invers(L1,L1i),invers(L2,L2i),suma_aux(L1i,L2i,0,Rez_aux),invers(Rez_aux,Rez).

suma_aux([],[],0,[]).
suma_aux([],[],1,[1]).
suma_aux([],L,0,L).
suma_aux(L,[],0,L).
suma_aux([H|T],[],1,[H1|T]):-H<9,H1 is H+1.
suma_aux([],[H|T],1,[H1|T]):-H<9,H1 is H+1.
suma_aux([],[H|T],1,[0|Rez]):-H is 9,suma_aux([],T,1,Rez).
suma_aux([H|T],[],1,[0|Rez]):-H is 9,suma_aux(T,[],1,Rez).
suma_aux([H1|T1],[H2|T2],F,[H|Rez]):-
    Carry is (H1+H2+F) div 10,
    suma_aux(T1,T2,Carry,Rez),
    H is (H1+H2+F) mod 10.










