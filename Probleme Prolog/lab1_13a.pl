%nr_ap(l1...ln,E) {0,n=0}
%                 {1+ nr_ap(l2...ln),n>0,l1=E}
%                 {nr_ap(l2...ln),n>0,l1!=E}
%nr_ap(L:lista,E:element,R:Element)
%model flux(i,i,o)

nr_ap([],_,0).
nr_ap([E|T],E,R):-!,nr_ap(T,E,R1),R is R1+1.
nr_ap([_|T],E,R):-nr_ap(T,E,R).

%construct(l1...ln) {[],n=0}
%                   {l1 U construct(l2...ln),
%                   nr_aparitii(construct(l2...ln),l1)==0,n>0}
%                   { construct(l2...ln),
%                   nr_aparitii(construc(l2...ln),l1)>0,n>0}
%  model flux(i,o)
%  construct(L:lista,R:lista)

 construct([],[]).
 construct([H|T],[H|R]):-construct(T,R),nr_ap(R,H,Nr),Nr is 0,!.
 construct([_|T],R):-construct(T,R).
