%find(l1...ln,Poz) {l1,Poz=1,n>0}
%                  {find(l2...ln,Poz-1,n>0}
%find(L:lista,Poz:element,E:element)
%model flux(i,i,o)

find([H|_],1,H).
find([_|T],Poz,R):-Poz1 is Poz-1,find(T,Poz1,R).
