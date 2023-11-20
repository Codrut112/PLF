%Pb10
%a)
% insert(lista_initiala,lista_finala,element ce trebuie
% adaugat,pozitia pe care trebuie adaugat)
% (i,o,i,i) model flux
%
% insert(l1...ln,E,POZ)          {[] ,L=[],n=0,poz>1}
%                                {E  , L=[],n=0,poz=1}
%                                {E U l1...ln, poz=1,n>1 }
%                              {l1 U insert(l2...ln,E,POZ-1)}
% L - lista de numere intregi
% L2 - lista rezultata
% E - elementul de introdus
% POZ - pozitia la care trebuie adaugat
%
% teste:
% insert([],R,E,1).
% R = [E].
% insert([1,2,3,4],R,E,4).
% R = [1, 2, 3, E, 4]
% insert([1,2,3,4,5,6,7,8],R,E,9).
% R = [1, 2, 3, 4, 5, 6, 7, 8, E].
% insert([1,2,3,4,5,6,7,8],R,E,1).
%R = [E, 1, 2, 3, 4, 5, 6, 7, 8] .
insert([],[],_,POZ):-POZ>1.
insert([],[E],E,1):-!.
insert(L,[E|L],E,1).
insert([H|T1],[H|L2],E,POZ):- POZ>1,POZ1 is POZ-1,insert(T1,L2,E,POZ1).
%parcurgem lista



%b
%
%cmmdc(X,Y,Z) Z=cmmdc(X,Y);
%Predicat:pb10b(l1...ln,X) - functia apelata, X=rezultatul
%model de flux = (i,o)
%
%pb10b=(l1...ln)= {l1 , daca n=1}
%                   {cmmdc(l1,l2),n=2}
%                   {pb10b(cmmdc(l1,l2),l3,l4..ln),n>2}
%cmmdc(X,Y)={Y , daca X=0}
%           {cmmdc(X-Y,Y), X>=y}
%           {cmmdc(X,Y-X), Y>X}
%
% model de flux = (i,i,o)

%  teste:
%  pb10b([12, 18, 24], GCD).
% GCD = 6
% pb10b([14, 21, 35], GCD).
%  GCD = 7
% pb10b([6, 9, 15], GCD).
% GCD = 3
% pb10b([8, 12, 28], GCD).
% GCD = 4
% model de flux = (i,i,o)

cmmdc(X,0,X):- -X>0,!.
cmmdc(0,X,X):- X>0 , !.
cmmdc(X,Y,Z):- X>=Y , X1 is X-Y , cmmdc(X1,Y,Z).
cmmdc(X,Y,Z):- Y>X , Y1 is  Y-X , cmmdc(X,Y1,Z).
pb10b([X],X).
pb10b([X1,X2],Z):-cmmdc(X1,X2,Z),!.
pb10b([X1,X2|T],Z):-cmmdc(X1,X2,X),pb10b([X|T],Z).
