/*****************************************/
/* Target: Calcualte number of non-iso matrices       */
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function K = GetNumNonIso(kappa,gamma)
assert(gamma>1 && gamma<4); % support 2 or 3 only
if (gamma == 2)
    K = 0.5*(GetJ(kappa)+nchoosek(kappa+3,3));
end
if (gamma == 3)
    K = GetA(kappa)+GetB(kappa)+GetC(kappa)-(GetJ(kappa)+GetD(kappa));
end
end

