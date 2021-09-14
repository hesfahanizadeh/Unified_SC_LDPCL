/*****************************************/
/* Target: Calcualte J_\kappa for non-iso matrices enum*/
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function J = GetJ(kappa)

J = sum(kappa+1 - 2*(0:floor(kappa/2)));

end

