%munte(l1...ln,aux)=1.[],n=1,aux=1
%                   2.l1 U munte(l2...ln,0),l1<l2,aux=0 sau aux=-1
%                   3.l1 U munte(l2....ln,1),aux=1 sau aux=0
%                   4.munte(l2...ln,aux)
%                   5.

%model de flux(i,i,o)
munte([H|_],1,[H]).
munte([H1,H2|T],0,[H1|R]):-H1<H2,munte([H2|T],0,R).
munte([H1,H2|T],-1,[H1|R]):-H1<H2,munte([H2|T],0,R).
munte([H1,H2|T],0,[H1|R]):-H1>H2,munte([H2|T],1,R).
munte([H1,H2|T],1,[H1|R]):-H1>H2,munte([H2|T],1,R).
munte([_,H2|T],Aux,R):-munte([H2|T],Aux,R).




