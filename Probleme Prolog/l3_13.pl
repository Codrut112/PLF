%col(C,N,M)=1.[],N=0
%           2.newc U col(newc,N-1,M),unde newc=candidat(M),newc!=c

%candidat(N)=1.N,N>0
%              candidat(N-1),N>0
%model flux(i,o)
candidat(N,N).
candidat(N,R):-N>1,N1 is N-1,candidat(N1,R).
%model flux(i,i,i,o)
col(0,_,_,[]).
col(N,M,E,[X|R]):-N>0,candidat(M,X),not(X=:=E),N1 is N-1,col(N1,M,X,R).

sol(N,M,R):-col(N,M,-1,R).
