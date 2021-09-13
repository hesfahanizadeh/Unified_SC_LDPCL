function B = GetB(kappa)

i = 0:floor(kappa/2);
j = i; [I,J] = meshgrid(i,j);
M = 2*(I+J); M = M(:); 
N = zeros(numel(M),1);
for n = 1:numel(N)
   if(M(n) <= kappa )
        N(n) =  nchoosek(kappa+3-M(n),3);
   end
end
B = sum(N) - GetA(kappa);
end

