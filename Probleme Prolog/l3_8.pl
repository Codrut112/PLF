%pronos(N,nr)=1.[1],n=1
%             2.['X'],n=1 nr<2
%             3. 1 U prons(N-1,nr),N>0
%             4.2 U pronos(N-1,nr),N>1
%             5.X U pronos(N-1,nr+1),nr<2,N>0
%model flux(i,i,o)
pronos(1,_,[1]):-!.
pronos(1,Nr,['X']):-Nr<2,!.
pronos(N,Nr,[1|R]):-N>0,N1 is N-1,pronos(N1,Nr,R).
pronos(N,Nr,[2|R]):-N>1,N1 is N-1,pronos(N1,Nr,R).
pronos(N,Nr,['X'|R]):-N>0,N1 is N-1,Nr<2,Nr1 is Nr+1,pronos(N1,Nr1,R).
%model flux
pronostic(R):-findall(S,pronos(4,0,S),R).
