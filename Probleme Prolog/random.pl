predecesor(X,Rez):-invers(X,Inv),predecesor_aux(Inv,RezX),invers(RezX,Rez).

identic(X,X).

predecesor_aux([H|T],[9|Rez]):- H is 0, predecesor_aux(T,Rez),!.
predecesor_aux([H|T],[H1|Rez]):- H1 is H -1,H1 \== 0,identic(T,Rez).
predecesor_aux([_|T],Rez):-identic(T,Rez).

 invers(L,R):-invers_aux(L,[],R).
 invers_aux([],Col,Col).
 invers_aux([H|T],Col,R):-invers_aux(T,[H|Col],R).
