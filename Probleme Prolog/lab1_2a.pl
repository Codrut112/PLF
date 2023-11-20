/*
   cmmmc(A,B){A*B/cmmdc}
   cmmdc(A,B){cmmdc(A-B,B),A>B}
             {cmmdc(A,B-A),B>A]
             {A,A=b}
  cmmdc(A,B,R)
  model flux(i,i,o)
*/

 cmmdc(A,A,A):-!.
 cmmdc(A,B,R):-A>B,!,A1 is A-B,cmmdc(A1,B,R).
 cmmdc(A,B,R):-B>A,B1 is B-A,cmmdc(A,B1,R).

cmmmc(A,B,R):-cmmdc(A,B,C), AB is A*B, R is AB div C .


/* calc(l1...ln,X){X,n=0}
*                {cmmmc(X,calc(l2...ln),n>0}
model flux(i,o)
*/



calc([],1).
calc([H|T],R):- calc(T,Rez_aux),cmmmc(Rez_aux,H,R).




