% Predicate to find the greatest common divisor (GCD) of two numbers using subtraction
cmmdc_fin(X,Y,Z):-cmmdc(X,Y,Z),!.
cmmdc(X,X,X).
cmmdc(X, 0, X).
cmmdc(X, Y, G) :- X > Y, Z is X mod Y, cmmdc(Z, Y, G).
cmmdc(X, Y, G) :- Y > X, Z is Y mod X, cmmdc(X, Z, G).

