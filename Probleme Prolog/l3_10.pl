%suma(l1...ln,Aux,S)=1.[],Aux%S==0
%                    2.l1 U suma(l2...ln,Aux+l1,S),n>0
%                    3.suma(l2...ln,Aux,S).
%                    4.suma(l2...ln,0,S),Aux=0

%model flux (i,i,i,o)
suma(_,Aux,S,[]):-0 is Aux mod S,Aux>0.
suma([_|T],Aux,S,R):-suma(T,Aux,S,R),0 is Aux.
suma([H|T],Aux,S,[H|R]):-Aux1 is Aux+H, suma(T,Aux1,S,R).
suma([_|T],Aux,S,R):-suma(T,Aux,S,R),not(0 is Aux mod S).

%lung(l1...ln)={0,n=0}
%              {1+lung(l2...ln),n>0}
%model flux (i,o)
lung([],0).
lung([_|T],L):-lung(T,L_aux),L is L_aux+1.

sol(L,R):-lung(L,Size),findall(S,suma(L,0,Size,S),R).
