%vale(l1...ln,F) { true,n=1,F=1}
            %     {vale(l2...ln,0),l1>l2,n>0,F=0}
             %     {vale(l2...ln,1),l1<l2,n>0}
%                  {fals,altfel}
% vale(lista,flag)
% vale(L,F)
% L-lista initiala
% flag de stare (0-descreste,1-creste)

%evale(l1...ln) {vale(l1..ln,0),l1>l2,n>=2}
%                {fals altfel}
evale([H1,H2|T]):-H1>H2,vale([H1,H2|T],0).

vale([_],1):-!.
vale([H1,H2|T],0):-H1>H2,!,vale([H2|T],0).
vale([H1,H2|T],_):-H1<H2,vale([H2|T],1).
