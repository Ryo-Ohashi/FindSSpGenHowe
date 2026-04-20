function FindSSpGenus5Howe(j_poly,K,L)
    j_set := {r[1]: r in Roots(j_poly,K)};
    R<x> := PolynomialRing(L); S := 64*(3*x-1)^3*(x-3)^3; T := (x-1)^2*(x+1)^4;
    l_set := {}; for j in j_set do l_set := l_set join {r[1]^2: r in Roots(S-j*T,K)}; end for; l_set := l_set diff {0};
    for s2,t2 in l_set do
        if s2 lt t2 then
            s4 := s2^2; t4 := t2^2;
            j := 256*(s4-s2*t2+t4)^3/(s4*t4*(s2-t2)^2);
            if j in j_set then return [s2,t2]; end if;
        end if;
    end for;
    return false;
end function;

p := NextPrime(StringToInteger(p1));
while p le StringToInteger(p2) do
    printf "In characteristic p = %o.\n", p;
    j_poly := SupersingularPolynomial(p); K := GF(p); L<z> := GF(p^2);
    time flag := FindSSpGenus5Howe(j_poly,K,K);
    if Type(flag) eq BoolElt then time FindSSpGenus5Howe(j_poly,L,L); else flag; end if;
    printf "---------------------------------------------------------\n";
    p := NextPrime(p);
end while;
quit;
