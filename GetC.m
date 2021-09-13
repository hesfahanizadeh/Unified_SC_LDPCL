function C = GetC(kappa)
C = (nchoosek(kappa+7,7)-3*GetB(kappa)-GetA(kappa))/6;
end

