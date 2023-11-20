%inv_aux(l1...ln,Col)  { Col, n=0 }
%                     {invers(l2...ln,l1+COl,n>0}
% inv_aux(L,Col,R)
% L-lista initiala
% Col-lista colectoare
% R-lista inversata
% model flux(i,i,o)

inv_aux([],Col,Col).
inv_aux([H|T],Col,R):-inv_aux(T,[H|Col],R).

%inv(l1...ln) {inv_aux(l1...n,[]).
%model flux(i,o)

inv(L,R):-inv_aux(L,[],R).


%dif_aux(l1...ln,L1...ln,F)
%                          {[],l1-L1+F=0,n=1}
%                          {0 U dif_aux(l2...ln,L1...Ln,0),
%                          l1-F1-F=0,dif_aux(l2...ln,L1...Ln,0) nu e []}
%
%                          {dif_aux(l1...ln,[],1),l1-F<0,n>0,m=0}
%
%                          { l1-F U[l2...ln],l1-F>=0,n>0,m=0}
%                          { L1-F+10 U
%                          dif_aux([],L1...Ln,1),L1-F<0,n=0,m>0} %
%


% dif_aux(l1...ln,L1...Lm,F) { [],l1-F1-F=0,n=1 }
%                            { l1-F U [l2...ln] , n>0,m=0 }
%                            {[],daca dif_aux(l2...ln,L1...Ln,0)=[] si
%                            l1-L1-F
 %                            { l1-L1-F U
%                            dif_aux(l2...ln,L2...Lm,0),l1-L1-F>0 }
%
%                            { l1-L1-F+10 u dif_aux(l2...ln,L2...Lm,1),
%                                  l1-L1-F<0 }
%model flux(i,i,i,o)

dif_aux([],_,0,[]).
dif_aux([H|T],[],F,[H1|T]):- H1 is H-F.
dif_aux([A],[B],F,[]):-H is A-B-F,H is 0,!.
dif_aux([H1|T1],[H2|T2],F,[]):- H is H1-H2-F, H=0,dif_aux(T1,T2,0,[]),!.
dif_aux([H1|T1],[H2|T2],F,[H|R]):- H is H1-H2-F, H>=0,dif_aux(T1,T2,0,R),!.
% dif_aux([H1|T1],[H2|T2],F,[H|R]):- H is H1-H2-F,
% H>=0,dif_aux(T1,T2,0,R),!.
dif_aux([H1|T1],[H2|T2],F,[H|R]):- A is H1-H2-F, A<0,H is A+10,dif_aux(T1,T2,1,R).

%dif(l1...ln,L1...Ln) { dif_aux(inv(l1...ln),inv(L1...Ln),0)}
%model flux(i,i,o)
dif(L1,L2,R):-inv(L1,I1),inv(L2,I2),dif_aux(I1,I2,0,R_aux),inv(R_aux,R).















