% invers_aux(L:lista initial,Col:lista colectoare,R:lista inversata)
% invers_aux(l1...ln,Col) {col,n=0}
%                         {invers_aux(l2...ln,Col U l1),n>0}

invers(L,R):-invers_aux(L,[],R).
invers_aux([],Col,Col).
invers_aux([H|T],Col,R):-invers_aux(T,[H|Col],R).

%succescor(L:lista initiala a numarului,F,R:succesorul numarului)
%succesor(l1...ln,F){[F],F>0,n=0}
                   %{[],n=0,F=0}
%                   {(l1+F)%10 U succesor(l2...ln,(l1+F)/10,n>0}

succesor([],0,[]):-!.
succesor([],F,[F]).
succesor([H|T],F,[H1|R]):-H1 is (H+F) mod 10, F_new is (H+F) div 10,succesor(T,F_new,R).
suc(L,R):-invers(L,L_aux),succesor(L_aux,1,L_aux2),invers(L_aux2,R).
