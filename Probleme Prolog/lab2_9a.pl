%sterge_secv(l1...ln){[],n=0}
%                    {[l1],n=1}
%                    {[],l1<l2,n=2}
%                    {l1 U sterge_secv(l2...ln),l1!=l2-1,n>1}
%                    {sterge_secv(l3...ln),l1=l2-1>l3,}
%                    {sterge_secv(l2...ln),l1+1=l2=l3-1}
%model flux(i,o)

sterge_secv([],[]).
sterge_secv([E],[E]).
sterge_secv([H1,H2],[]):-H1 is H2-1.
sterge_secv([H1,H2|T],[H1|R]):- \+H1 is H2-1,sterge_secv([H2|T],R).
sterge_secv([H1,H2,H3|T],R):- H1 is H2-1,\+ H3 is H2+1,sterge_secv([H3|T],R).
sterge_secv([H1,H2,H3|T],R):- H1 is H2-1, H3 is H2+1,sterge_secv([H2,H3|T],R).
