function FindSSpGenus6Howe(j_poly,K,L)
    j_set := {r[1]: r in Roots(j_poly,K)};
    R<x> := PolynomialRing(L); S := 6912*x*(2*x-1)^3*(x-2)^3; T := (x-1)^2*(x+1)^6;
    l_set := {}; for j in j_set do l_set := l_set join {r[1]: r in Roots(S-j*T,K)}; end for; l_set := l_set diff {0};
    for s3,t3 in l_set do
        if s3 lt t3 and s3^2 ne t3^2 then
            j := 6912*s3*t3*(2*s3-t3)^3*(s3-2*t3)^3/((s3-t3)^2*(s3+t3)^6);
            if j in j_set then return [s3,t3]; end if;
        end if;
    end for;
    return false;
end function;

p := NextPrime(StringToInteger(p1));
while p le StringToInteger(p2) do
    printf "In characteristic p = %o.\n", p;
    j_poly := SupersingularPolynomial(p); K := GF(p); L<z> := GF(p^2);
    time flag := FindSSpGenus6Howe(j_poly,K,K);
    if Type(flag) eq BoolElt then time FindSSpGenus6Howe(j_poly,L,L); else flag; end if;
    printf "---------------------------------------------------------\n";
    p := NextPrime(p);
end while;
quit;
