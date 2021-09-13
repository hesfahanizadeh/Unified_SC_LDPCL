function M = GenMatFromColDist(d)
gamma = log2(numel(d));
assert(floor(gamma) == gamma && gamma > 1 && gamma < 4);
kappa = sum(d);
assert(kappa > gamma); M = [];
for i = 1:numel(d)
   v = de2bi(i-1,gamma,'left-msb');
   Mt = [M repmat(v',1,d(i))];
   M = Mt;
end
end