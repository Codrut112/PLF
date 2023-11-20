%divizori(E:element,L,lista de divizori proprii ai elementului)
%divizori(E,D):    {[],D>E/2}
%                  { D U divizori(E,D+1),E%D=0}
                  % {divizori(E,D+1),E%D!=0}
%model flux (i,i,o)
 divizori(E,D,[]):-D> E div 2,!.
 divizori(E,D,[D|R]):-A is E mod D, A is 0, !,D1 is  D+1  ,divizori(E,D1,R).
 divizori(E,D,R):-D1 is  D+1  ,divizori(E,D1,R).

%concat(l1...ln,L1...Lm){[l1+concat(l2...ln,L1...Lm),n>0}
%                       {[L1...Lm],n=o}
% model flux(i,i,o)
% concat(L1:lista1,L2:lista2,R: lista1 U lista2}

concat([],L,L).
concat([H|T],L,[H|R]):-concat(T,L,R).
%add(L:lista initiala,R:lista cu divizorii elementelor adaugati)
%add(l1...ln)  {[],n=0}
%                      {l1 + concat(divizori(l1),add(l2...ln),n>0}

add([],[]).
add([H|T],[H|R]):-add(T,Aux),divizori(H,2,D),concat(D,Aux,R).

