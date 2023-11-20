%invers(l1...lm) {[],n=0}
%                {invers(l2...ln) U l1,n>0}
%model flux(i,o)

invers_aux([],Col,Col).
invers_aux([H|T],Col,R):-invers_aux(T,[H|Col],R).

invers(L,R):-invers_aux(L,[],R).

%inm(L:lista,E:element,F:flag,R:lista)
%inm(l1...ln,E,F)  {[],F=0,n=0}
 %                 { F,n=0}
%                 {(F+l1*E)%10 U inm(l2...ln,E,(F+l1*E)/10),n>0}
%model flux(i,i,i,o)
inm_aux([],_,0,[]):-!.
inm_aux([],_,F,[F]).
inm_aux([H|T],E,F,[C|R]):-A is H*E+F,F_new is A div 10,C is A mod 10,inm_aux(T,E,F_new,R).


inm(L,E,R):-invers(L,R_aux),inm_aux(R_aux,E,0,Rez_aux),invers(Rez_aux,R).


