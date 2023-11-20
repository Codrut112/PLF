population(zalau,100).
population(cluj,10000).
population(bucuresti,500000).
population(jibou,5).

area(zalau,5).
area(cluj,3232).
area(bucuresti,3242).
area(jibou,2).

density(X,Y):-population(X,Pop),
               area(X,Area),
                Y is Pop/Area.
