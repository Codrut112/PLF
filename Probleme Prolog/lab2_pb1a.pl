%inv_aux(l1...ln,Col) {[],n=0}
%                     { inv_aux(l2...ln,l1 U col),n>0}
%model flux(i,i,o)
%inv_aux(L:lista initiala,Col:lista colectoare,R:lsita inversata)

inv_aux([],Col,Col).
inv_aux([H|T],Col,R):-inv_aux(T,[H|Col],R).

inv(L,R):-inv_aux(L,[],R).

%add(l1...ln,L1...Lm,F) {[],n=0,m=0,F=0 }
%                       {[F],n=0,m=0,F>0}
%                       { (l1 + F)mod 10 U
%                       add(l2...ln,[],0,(l1 + F) div 10)m=0,n>0,F>0 }
%                      { (L1 + F) div 10 U add([],L2..Lm,(L1 + F)div 10 )m<0,n=0,F>0 }
%                     { (L1+l1+F) mod 10 U
%                     add(l2...ln,L2..Lm,(L1 + l1 + F) div 10),n>0,m>0}
%add(L1,L2,F,R)
%model flux(i,i,i,o)
add([],[],0,[]):-!.
add([],[],F,[F]).
add([H|T],[],F,[H1|R]):- H1 is (H+F) mod 10,F_new is (H+F) div 10,add(T,[],F_new,R).
add([],[H|T],F,[H1|R]):- H1 is (H+F) mod 10,F_new is (H+F) div 10,add([],T,F_new,R).
add([H1|T1],[H2|T2],F,[S|R]):- S is (H1+H2+F) mod 10,F_new is (H1+H2+F) div 10,add(T1,T2,F_new,R).

adunare(L1,L2,R):-inv(L1,I1),inv(L2,I2),add(I1,I2,0,R_aux),inv(R_aux,R).
