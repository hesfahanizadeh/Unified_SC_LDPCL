/*****************************************/
/* Target: Calcualte A_\kappa                         */
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function A = GetA(kappa)
i = 0:floor(kappa/3);
j = i; [I,J] = meshgrid(i,j);
M = 3*(I+J); M(M > kappa) = kappa + 1;
A = sum(sum(kappa+1 - M));
end

