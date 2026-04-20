function FindSSpGenus4Howe(j_poly,K,L)
    j_set := {r[1]: r in Roots(j_poly,K)};
    R<x> := PolynomialRing(L); S := 256*(x^2-x+1)^3; T := x^2*(x-1)^2;
    l_set := {}; for j in j_set do l_set := l_set join {r[1]: r in Roots(S-j*T)}; end for;
    for l1,l3 in l_set do
        if l1 ne l3 then
            num_s := l1^2-l3;
            if num_s ne 0 then
                den_st := l1^2-2*l1+l3;
                if den_st ne 0 then
                    num_t := 2*l1*l3-l1^2-l3;
                    if num_t ne 0 then
                        s := num_s/den_st; t := num_t/den_st;
                        l4 := l3/t^2; j4 := 256*(l4^2-l4+1)^3/(l4^2*(l4-1)^2);
                        if j4 in j_set then return [s,t]; end if;
                    end if;
                end if;
            end if;
        end if;
    end for;
    return false;
end function;

p := NextPrime(StringToInteger(p1));
while p le StringToInteger(p2) do
    if p mod 6 eq 1 then
        printf "In characteristic p = %o.\n", p;
        j_poly := SupersingularPolynomial(p); K := GF(p); L<z> := GF(p^2);
        time flag := FindSSpGenus4Howe(j_poly,K,L);
        if Type(flag) eq BoolElt then time FindSSpGenus4Howe(j_poly,L,L); else flag; end if;
        printf "---------------------------------------------------------\n";
    end if;
    p := NextPrime(p);
end while;