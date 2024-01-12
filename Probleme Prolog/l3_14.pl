%suma(l1...ln,S):1.[],S=0
%                2.l1 U suma(l2...ln,S-l1),S>0,n>0
%                3.suma(l2...ln,S),n>0
%model flux(i,i,o)
suma(_,0,[]):-!.
suma([H|T],S,[H|R]):-S>0,S1 is S-H,suma(T,S1,R).
suma([_|T],S,R):-S>0,suma(T,S,R).

sol(L,S,R):-findall(Q,suma(L,S,Q),R).
