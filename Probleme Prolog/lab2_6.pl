inlocuieste([],_,_,[]).
inlocuieste([H|T],E,L_mic,[L_mic|L_rez]):- E == H,
    inlocuieste(T,E,L_mic,L_rez),
    adauga(L_rez,L_mic).
inlocuieste([H|T],E,L_mic,[H|L_rez]):- E\==H ,inlocuieste(T,E,L_mic,L_rez).
adauga(_,[]).
adauga([H|L_rez],L_mic):.
