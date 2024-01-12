%suma_cons(E,S)=1.[],S=0
%               2.candidat(S) U suma_cons(E+1,S-cand),E=-1
%               3.E U suma_cons(E+1,S-E),E!=-1
%model flux(i,i,o)
suma_cons(_,0,[]).
suma_cons(E,S,[E1|R]):-S>0,E1 is E+1,S1 is S-E1,suma_cons(E1,S1,R).

candidat(N,N).
candidat(N,R):-N1 is N-1,N>1,candidat(N1,R).

sol(S,[X|R]):-N is S-1,candidat(N,X),S1 is S-X,suma_cons(X,S1,R).
