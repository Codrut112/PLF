%gen(l1...ln,m)=1.[],m=0
%               2.l1 U gen(l2...ln,m-1),m>0
%               3.gen(l2...ln,m),m>0
%model flux (i,i,o)

gen(_,0,[]):-!.
gen([H|T],M,[H|R]):-M>0,M1 is M-1,gen(T,M1,R).
gen([_|T],M,R):-gen(T,M,R).


sol(L,M,R):-findall(S,gen(L,M,S),R).
