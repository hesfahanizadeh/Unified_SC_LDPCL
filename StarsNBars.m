function dist = StarsNBars(kappa,gamma)
v = 1:(kappa+2^gamma-1);
C = nchoosek(v,kappa);
dist = zeros(size(C,1),2^gamma);
for i = 1:size(C,1)
    dist(i,:) = GenColDist(gamma,C(i,:));
end

