%pa(n,d)=1. '(' U pa(n-1,d+1),n>=d+2
%        2. [],n=0,d=0
%        3. ')' pa(n-1,d-1),d>0,n>0

%model flux(i,i,o)

pa(0,0,[]).
pa(N,D,['('|T]):-N>0,N>=D+2,N1 is N-1,D1 is D+1,pa(N1,D1,T).
pa(N,D,[')'|T]):-N>0,D>0,N1 is N-1,D1 is D-1,pa(N1,D1,T).
paranteze(N,R):-findall(S,pa(N,0,S),R).
