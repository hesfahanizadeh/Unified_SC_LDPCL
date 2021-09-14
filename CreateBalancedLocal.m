/*****************************************/

/* Target: Implementation of the balanced construction*/

/* By: Eshed Ram (eshed.ram@gmail.com)                */

/* Update: 09/14/2021                                 */

/*****************************************/
function H_L = CreateBalancedLocal(gamma_l,kappa,nu)
if(nu<0 || nu>=kappa)
    error('Invalid values for nu and kappa');
end
a = floor(nu/gamma_l); b = nu - gamma_l*a; 
H_L = [ones(gamma_l,kappa-nu) SMatrix(gamma_l,b)];
for i = (gamma_l-1):-1:0
    H_L = [H_L QMatrix(gamma_l,a,i)];
end

end

