%candidat(n)=1.n,n>0
%              2.candidat(n-1),n>1
%model flux (i,o)
candidat(N,N):-N>0.
candidat(N,R):-N>0,N1 is N-1,candidat(N1,R).

%apare(x,l1...ln)={false,n=0}
%      {true,x=l1}
%      {apare(x,l2..ln),n>0}
apare(X,[X|_]):-!.
apare(X,[_|T]):-apare(X,T).

%gen(n,m,nr,Col):1.[],nr=0
%            2.c U gen(n,m,nr),c=candidat(n),nu
%            apare(Col),abs(c-Col1)>=m
%model flux(i,i,i,i,o)
gen(_,_,0,_,[]).
gen(N,M,Nr,[H|T],[X|R]):-candidat(N,X),not(apare(X,[H|T])),abs(H-X)>=M,Nr1 is Nr-1,gen(N,M,Nr1,[X,H|T],R).
gen(N,M,Nr,[],[X|R]):-candidat(N,X),Nr1 is Nr-1,gen(N,M,Nr1,[X],R).
sol(N,M,R):-findall(L,gen(N,M,N,[],L),R).
