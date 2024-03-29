
verif_col([H1,H2,H3,H4|T]):- coliniare(H1,H2,H3),!,verif_col([H2,H3,H4|T]).

submultimi([],[]).
submultimi([_|T],Rez):-submultimi(T,Rez).
submultimi([H|T],[H|Rez]):-submultimi(T,Rez).

submultimi_coliniare(L,Rez):-submultimi(L,Rez),verif_col(Rez).

%problema 2
% Fiind dat un numar n pozitiv, se cere sa se determine toate
% descompunerile
% sale ca suma de numere prime distincte.

prim(X):- X > 1,prim_aux(X,2).

prim_aux(X,C):- C > X div 2,!.
prim_aux(X,C):-D is X mod C, D \== 0,C1 is C +1,prim_aux(X,C1).

lista_prima([]):-!.
lista_prima([H|T]):-prim(H),!,lista_prima(T).

suma_prim(X,L):-suma_prim_aux(X,0,L),lista_prima(L).
suma_prim_aux(0,_,[]).
suma_prim_aux(X,C,Rez):- C=<X,C1 is C+1,suma_prim_aux(X,C1,Rez).
suma_prim_aux(X,C,[C|Rez]):-X1 is X-C,X1 >=0, C1 is C+1,suma_prim_aux(X1,C1,Rez).

%problema 3
% Se da sirul a1,..., an. Se cere sa se determine toate subsirurile
% strict crescatoare ale sirului a.

crescator([]):-!.
crescator([_]):-!.
crescator([H1,H2|T]):- H1 < H2,!,crescator([H2|T]).

subsir([],[]).
subsir([H|T],[H|Rez]):-subsir(T,Rez).
subsir(L,Rez):-not(atomic(L)),subsir([],Rez).
subsir([_|T],Rez):-subsir(T,Rez).

contine([H|_],H):-!.
contine([H|T],E):- H \== E,contine(T,E).

elimina_dubluri([],[]).
elimina_dubluri([H|T],Rez):- contine(T,H),!,elimina_dubluri(T,Rez).
elimina_dubluri([H|T],[H|Rez]):-elimina_dubluri(T,Rez).

subsiruri(L,Rez):-
    findall(Colectat,subsir(L,Colectat),RezX),elimina_dubluri(RezX,Rez).

subsiruri_crescatoare(L,Rez):-subsiruri(L,RezX),subsiruri_crescatoare_aux(RezX,Rez).

subsiruri_crescatoare_aux([H|_],H):-crescator(H).
subsiruri_crescatoare_aux([_|T],Rez):-subsiruri_crescatoare_aux(T,Rez).

%problema 4
% Se dau doua numere naturale n si m. Se cere sa se afiseze in toate
% modurile
% posibile toate numerele de la 1 la n, astfel incat intre orice doua
% numere
% afisate pe pozitii consecutive, diferenta in modul sa fie >=m.

genereazaN(N,[]):-N < 1,!.
genereazaN(N,[N|Rez]):- N1 is N-1,genereazaN(N1,Rez).

insert(L,V,[V|L]).
insert([H|T],V,[H|Rez]):-insert(T,V,Rez).

perm([],[]).
perm([H|T],Rez):-perm(T,L),insert(L,H,Rez).

difM([H1,H2],M):- D is H1 - H2, M =< abs(D),!.
difM([H1,H2|T],M):-not(atomic(T)),!,difM([H1,H2],M),difM([H2|T],M).

moduriN(N,M,Rez):-genereazaN(N,L),perm(L,Rez),difM(Rez,M).

%problema 5
% Sa se genereze lista submultimilor cu N elemente, cu elementele unei
% liste
% date. Ex: [2,3,4] N=2 => [[2,3],[2,4],[3,4]]

submultimiN(L,N,Rez):-submultimi(L,Rez),lungime(Rez,N).

list_subm(L,N,Rez):-
    findall(Colectat,submultimiN(L,N,Colectat),Rez).

%problema 6
% Sa se genereze toate sirurile de n paranteze ce se inchid
% corect. Exemplu:n=4 sunt 2 solutii: (()) si ()()

genereazaP([],0).
genereazaP([H|T],N):-N>0,H = "(",N1 is N-1,genereazaP(T,N1).
genereazaP([H|T],N):-N>0,H = ")",N1 is N-1,genereazaP(T,N1).

valideazaP([],0).
valideazaP([H|T],N):-N>=0,H = "(",!, N1 is N+1,valideazaP(T,N1).
valideazaP([H|T],N):-N>=0,H = ")",!, N1 is N-1,valideazaP(T,N1).

scrie([]):-nl,!.
scrie([H|T]):-write(H),scrie(T).

paranteze(N):-genereazaP(Rez,N),valideazaP(Rez,0),scrie(Rez),fail.

%problema 7
% Sa se genereze lista aranjamentelor de K elemente, cu elementele unei
% liste date. Ex:
% [2,3,4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4],[4,3]]
% (nu neaparat in aceasta ordine)

insereaza(E, L, [E|L]).
insereaza(E, [H|L], [H|T]) :- insereaza(E,L,T).

lungime([],0).
lungime([_|T],N):-lungime(T,N1),
    N is N1+1.

subm([], []).
subm([_|T],L):-subm(T,L).
subm([H|T], L):-subm(T, P),insereaza(H, P, L).


aranj(L, Rez, K):-subm(L,Rez),
    lungime(Rez,K).

list_aranj(L,Rez,K):-
    findall(Colectat,aranj(L,Colectat,K),Rez).

%problema 8
% Un jucator la PRONOSPORT vrea sa aleaga pronosticuri pentru 4 meciuri.
% Pronosticurile pot fi 1,X,2. Sa se genereze toate variantele posibile
% stiind ca:
% - ultimul pronostic nu poate fi 2
% - sa nu fie mai mult de doua pronosticuri X.

pronostic:-pronostic_aux(L,4,2),scrie(L),fail.

pronostic_aux([],0,_).
pronostic_aux([H|T],N,CX):-N>1,H = 2,N1 is N-1,pronostic_aux(T,N1,CX).
pronostic_aux([H|T],N,CX):-N>0,CX>0,H = "X",N1 is N-1,CX1 is CX-1,pronostic_aux(T,N1,CX1).
pronostic_aux([H|T],N,CX):-N>0,H = 1,N1 is N-1,pronostic_aux(T,N1,CX).

%problema 9
% Dandu-se o valoare N, se cere sa se genereze permutarile de N elemente
% cu proprietatea ca oricare ar fi 2<=i<=n exista un 1<=j<=i astfel
% incat |v(i)-v(j)| = 1.

genereazaPerm(N,[]):-N < 1,!.
genereazaPerm(N,[N|Rez]):- N1 is N-1,genereazaPerm(N1,Rez).

insertV(L,V,[V|L]).
insertV([H|T],V,[H|Rez]):-insertV(T,V,Rez).

dif1([H|_],E):- D is E - H, D is -1 ,!.
dif1([H|_],E):- D is E - H, D is 1 ,!.
dif1([_|T],E):-dif1(T,E).

invers(L, Rez) :- invers_aux([], L, Rez).

invers_aux(Col, [], Col).
invers_aux(Col, [H|T], Rez) :-
    invers_aux([H|Col], T, Rez),!.

exista_predecesor_cu_diferenta_in_modul_1([_]).
exista_predecesor_cu_diferenta_in_modul_1([H|T]):-dif1(T,H),exista_predecesor_cu_diferenta_in_modul_1(T).

permAbs(N,Rez):-genereazaPerm(N,L),perm(L,Rez),invers(Rez,RezX),exista_predecesor_cu_diferenta_in_modul_1(RezX).

%problema 10
% Se da sirul a1,..., an cu elemente numere intregi distincte. Se cere sa
% se determine toate submultimile avand suma divizibila cu n.

suma([],0).
suma([H|T],S):-suma(T,S1),S is S1 + H.

submultime_aux([H|_],H).
submultime_aux([_|T],Rez):-submultime_aux(T,Rez).

submultime(L,Rez):-subsiruri(L,RezX),submultime_aux(RezX,Rez).

sumaDivN(L,Rez):-lungime(L,N),submultime(L,Rez),suma(Rez,Suma),D is Suma mod N, D is 0,Rez \= [].

%problema 11
% Sa se genereze toate subsirurile de lungime 2n+1, formate
% doar din 0, -1 sau 1, astfel incat a1 = 0, ..., a2n+1= 0 si | ai+1 –ai| = 1 sau 2, pentru orice 1 <=i <= 2n.

ternar(1,[0]).
ternar(N,[H|T]):-N>0,H = 1,N1 is N-1,ternar(N1,T).
ternar(N,[H|T]):-N>0,H = 0,N1 is N-1,ternar(N1,T).
ternar(N,[H|T]):-N>0,H = -1,N1 is N-1,ternar(N1,T).

dif12([H1,H2]):- D is H2 -H1, D is 2,!.
dif12([H1,H2]):- D is H2 -H1, D is 1,!.
dif12([H1,H2]):- D is H2 -H1, D is -2,!.
dif12([H1,H2]):- D is H2 -H1, D is -1,!.

dif12([H1,H2|T]):-not(atomic(T)),dif12([H1,H2]),dif12([H2|T]).

identic(X,X).
subsiruri2N(N,Rez):- N1 is 2*N,ternar(N1,Rez1), identic(Rez,[0|Rez1]),dif12(Rez).

%problema 12
% Se da sirul a1,..., an format din numere intregi distincte. Se cere sa
% se afiseze toate submultimile cu aspect de "munte"(o secvență se spune
% ca are aspect de "munte" daca elementele cresc pana la un moment dat,
% apoi descresc. De
% ex. 10 16 27 18 14 7).

munte([H|T]):-munte_aux(H,T,0).

munte_aux(V,[H|T],0):- V < H,!,munte_aux(H,T,-1).
munte_aux(V,[H|T],-1):- V < H,!,munte_aux(H,T,-1).
munte_aux(V,[H|T],-1):- V > H,!,munte_aux(H,T,1).
munte_aux(V,[H|T],1):- V > H,!,munte_aux(H,T,1).
munte_aux(_,[],1).

submultimi_munte(L,Rez):-submultime(L,Rez),munte(Rez).

%problema 13
% "Colorarea hartilor". Se dau n tari. Se cer toate modalitatile de
% colorarea celor n tari cu m culori, astfel inca doua tari vecine sa nu
% fie colorate la fel.

initializare([],_,[]).
initializare([H|T],M,[[H,M]|Rez]):-initializare(T,M,Rez).

colorare([],[]).
colorare([[H,M]|T],Rez):-M1 is M-1,M>1,colorare([[H,M1]|T],Rez).
colorare([[H,M]|T],[[H,M]|Rez]):-colorare(T,Rez).

vecini([H1,H2],[[H1,H2]|_]):-!.
vecini([H1,H2],[[H2,H1]|_]):-!.
vecini([H1,H2],[_|T]):-vecini([H1,H2],T).

validare([[H1,_],[H2,_]],Perechi):-not(vecini([H1,H2],Perechi)),!.
validare([[H1,M1],[H2,M2]],Perechi):-vecini([H1,H2],Perechi),M1 \= M2,!.
validare([[H1,M1],[H2,M2]|T],Perechi):-not(atomic(T)),!,validare([[H1,M1],[H2,M2]],Perechi),validare([[H1,M1]|T],Perechi).

validare_total([_],_):-!.
validare_total([H|T],Perechi):-validare([H|T],Perechi),!,validare_total(T,Perechi).

solutie_colorare(Tari,Perechi,M,Rez):-initializare(Tari,M,RezX),colorare(RezX,Rez),validare_total(Rez,Perechi).

%problema 14
% Sa se scrie un program care genereaza lista submultimilor de suma S
% data,cu elementele unei liste. Ex: [1,2,3,4,5,6,10] si S=10 =>
% [[1,2,3,4], [1,4,5],[2,3,5], [4,6], [10]]
% (nu neaparat in aceasta ordine)

conditie_submultimi_suma(L,S,Rez):-submultimi(L,Rez),suma(Rez,S).

submultimi_suma(L,S,Rez):-findall(Colector,conditie_submultimi_suma(L,S,Colector),Rez).

%problema 15
% Se da un numar n pozitiv. Se cere sa se determine toate descompunerile
% lui n ca suma de numere naturale consecutive.

consecutive([H1,H2]):-D is H2 -H1, D is 1,!.
consecutive([H1,H2|T]):-not(atomic(T)),consecutive([H1,H2]),consecutive([H2|T]).

partitii(X,[H|T]):-partitii_aux(X,0,[H|T]),H \= 0,consecutive([H|T]).
partitii_aux(0,_,[]).
partitii_aux(X,C,Rez):- C=<X,C1 is C+1,partitii_aux(X,C1,Rez).
partitii_aux(X,C,[C|Rez]):-X1 is X-C,X1 >=0, C1 is C+1,partitii_aux(X1,C1,Rez).

