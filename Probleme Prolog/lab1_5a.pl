%sterge(L,E,R)
%L-lista initiala
%E-elementul de sters
%R-lista dupa stergerea aparitiilor elementuli
%sterge(l1...ln,E)   {[],n=0}
%                    { l1 U sterge(l2...ln,E),n>0,E!=l1}
%                    { sterge(l2...ln,E),n>0,E=l}
% model flux(i,i,o)

sterge([],_,[]).
sterge([E|T],E,Rez):-!,sterge(T,E,Rez).
sterge([H|T],E,[H|Rez]):-sterge(T,E,Rez).
