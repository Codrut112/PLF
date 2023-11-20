%maxim(lista,element)
%maxim(L,E)
%L-lista initiala
%E-maximul
%maxim(l1...ln) {l1,n=1}
%               {l1,l1>maxim(l2...ln),n>0}
%               {maxim(l2...ln),l1<maxim(l2...ln),n>0}
%  model flux(i,o)
maxim([E],E).
maxim([H|T],H):-maxim(T,E),H>E,!.
maxim([_|T],R):-maxim(T,R).

%sterge(lista,element,lista)
%sterge(L,E,R)
%L-lista initiala
%E-elementul de sters
%R-lista rezultat
%sterge(l1...ln,E)  { [],n=0}
%                   {l1 U sterge(l2...ln,E),l1!=E,n>0}
%                   {sterge(l2...ln,E),l1=E,n>0}
%                   model flux(i,i,0)

sterge([],_,[]).
sterge([E|T],E,Rez):-!,sterge(T,E,Rez).
sterge([H|T],E,[H|Rez]):-sterge(T,E,Rez).

%sterge_maxim(lista,lista)
%sterge_maxim(L,R)
%sterge_maxim(L)={sterge(L,maxim(L))}
%model flux(i,o)

sterge_maxim(L,Rez):-maxim(L,E),sterge(L,E,Rez).
