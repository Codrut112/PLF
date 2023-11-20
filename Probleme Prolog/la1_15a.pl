% da(L:lista)
% da(l1...ln) {true,n=0}
%             {da(l3...ln),n>=2}
%             {false,altfel}
% model flux(i,i)

da([]).
da([_,_|T]):-da(T).

