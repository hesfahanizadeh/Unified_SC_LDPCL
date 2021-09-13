function J = GetJ(kappa)

J = sum(kappa+1 - 2*(0:floor(kappa/2)));

end

