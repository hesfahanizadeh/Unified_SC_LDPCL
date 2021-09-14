/*****************************************/
/* Target: Calcualte C_\kappa for non-iso matrices enum for gamma=3*/
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function C = GetC(kappa)
C = (nchoosek(kappa+7,7)-3*GetB(kappa)-GetA(kappa))/6;
end

