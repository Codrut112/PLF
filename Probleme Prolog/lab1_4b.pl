
%elimina(l1...ln,K){[],n=0}
%                          {[l2...ln],k=0,n>0}
%                          {l1 U elimina(l2...ln,K-1),n>0,K>0}
% model flux(i,i,o)
% elimina(L,K,Rez)
% L-lista initaila
% K-pozitia de pe care se va eleimina elementul
% Rez-lista rezultat

elimina([],_,[]):-!.
elimina([_|T],1,T):-!.
elimina([H|T],K,[H|R]):-K1 is K-1,elimina(T,K1,R).
