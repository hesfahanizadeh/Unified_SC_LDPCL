function dist = GenColDist(gamma,Comb)
dist = zeros(1,2^gamma); anchor = 1;
for j = 1:length(Comb)
   ind = anchor + Comb(j) - 1;
   dist(ind) = dist(ind) + 1;
   anchor = ind; Comb = Comb - Comb(j);
end
end

