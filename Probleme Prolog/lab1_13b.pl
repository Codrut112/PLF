%cmmdc(A,B){A,A=B}
%          {cmmdc(A-B,B),A>B}
%          {cmmdc(A,B-A),B>A}
%cmmdc(A:element,B:element,C:element)
%model flux(i,i,o)
cmmdc(A,A,A).
cmmdc(A,B,R):-A>B,A1 is A-B,cmmdc(A1,B,R).
cmmdc(A,B,R):-B>A,B1 is B-A,cmmdc(A,B1,R).

%cmmdc_lista(l1...ln){l1,n=1}
                    % {cmmdc(l1,cmmdc(l2...ln)),n>1}
%cmmdc(L:lista,R:element)
%model flux(i,o)

cmmdc_lista([A],A).
cmmdc_lista([H|T],R):-cmmdc_lista(T,R_aux),cmmdc(R_aux,H,R).
