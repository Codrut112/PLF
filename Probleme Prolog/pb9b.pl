/*
 * construct(M,N,L)
 * M-numarul de inceput
 * N-numarul de sfarsit
 * L-lista numerelor de la M la N
 * constuct(element,element,lista)
 * construct(M,N)={[],M=N}
 *                 {M U construct(M+1,N)}
 * model flux(i,i,o)
 */
 construct(N,N,[N]).
construct(M,N,[M|L]):-M1 is M+1,construct(M1,N,L).

