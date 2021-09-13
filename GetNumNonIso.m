function K = GetNumNonIso(kappa,gamma)
assert(gamma>1 && gamma<4); % 2 or 3
if (gamma == 2)
    K = 0.5*(GetJ(kappa)+nchoosek(kappa+3,3));%-(kappa+1);
end
if (gamma == 3)
    K = GetA(kappa)+GetB(kappa)+GetC(kappa)-(GetJ(kappa)+GetD(kappa));
end
end

