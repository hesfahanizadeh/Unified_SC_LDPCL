/*****************************************/
/* Target: Calcualte D_\kappa for non-iso matrices enum for gamma=3*/
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function D = GetD(kappa)
D = 0.5*(nchoosek(kappa+3,3)-GetJ(kappa));
end

