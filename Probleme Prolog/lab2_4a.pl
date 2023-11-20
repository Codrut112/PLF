/*interclasare(l1...ln,L1...Lm){[],n=m=0}
                               {[l1...ln],m=0,n>0}
                               {[L1...Lm},n=,m>0}
                               {l1 U
                               interclasare(l2...ln,L1...Lm),l1<L1,m>0,n>0}
                                {L1 U
                               interclasare(l1...ln,L2...Lm),l1>L1,m>0,n>0}
                                { l1 U interclasare(l2...ln,L2...Lm)
                                l1=L1}
interclasare(lista,lista,lista)
interclasare(L1,L2,R).
L1-prima lista
sortata L2-a doua lista sortata
R- rezultaul interclasari
model flux(i,i,o)*/
interclasare([],[],[]).
interclasare(L,[],L).
interclasare([],L,L).
interclasare([H1|T1],[H2|T2],[H1|Rez]):-H1<H2,interclasare(T1,[H2|T2],Rez).
interclasare([H1|T1],[H2|T2],[H2|Rez]):-H1>H2,interclasare([H1|T1],T2,Rez).
interclasare([H1|T1],[H2|T2],[H2|Rez]):-H1 is H2,interclasare(T1,T2,Rez).







