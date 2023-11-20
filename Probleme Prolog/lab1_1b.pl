/*adauga1(l1...ln):{[], n=0}
 *                 { l1 U 1 U adauga1(l1...ln),n>0,l1-par}
 *                 { l1 U  adauga1(l1...ln),n>0,l1-impar}

 */
adauga1([],[]).
adauga1([H|T],[H,1|Rez]):-D is H mod 2,D is 0,!, adauga1(T,Rez).
adauga1([H|T],[H|Rez]):-adauga1(T,Rez).
