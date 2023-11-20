lengt([],0).
lengt([_|T],N):-length(T,N1),N is N1+1.
