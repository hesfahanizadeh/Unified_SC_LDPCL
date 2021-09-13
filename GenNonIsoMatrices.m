function MatList = GenNonIsoMatrices(kappa, gamma)
%% Generate all column distributions
Dists = StarsNBars(kappa,gamma);
NumDists1 = size(Dists,1);
%% Eliminate all row permutations
% choose a representive from each equivalence class
IsRep = zeros(NumDists1,1);
for dd = 1:NumDists1
    IsRep(dd) = IsColDistRepresent(Dists(dd,:),gamma);
end
Dists = Dists( find(IsRep),:);
%% Eliminate invalid column distributions (all-zero rows)
NumDists2 = size(Dists,1);
IsVal = zeros(NumDists2,1);
for dd = 1:NumDists2
    IsVal(dd) = IsColDistValid(Dists(dd,:),gamma);
end
Dists = Dists( find(IsVal),:);
NumDists3 = size(Dists,1);
%% Create Matrices
MatList = cell(NumDists3,1);
for dd = 1:NumDists3
    MatList{dd} = GenMatFromColDist(Dists(dd,:));
end

end