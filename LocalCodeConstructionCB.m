%% code parameters
kappa = 13;gamma_l=3; gamma = 6; gamma_c = gamma - gamma_l;
%from Tanner's paper 
p = 157; 
% erased circulants
nu = 12; 
%% create codes
% Unbalnced partition
B = ones(gamma,kappa); %CC are irelevant
B(gamma_c+1,end-nu+1:end) = 0;
H = CBlift(B,p);
localRow = gamma_c*p+1; HL_1 = H(localRow:end,:);

% Balanced partition
B = ones(gamma,kappa);endj= 0;
B(gamma_c+1:end,:) = CreateBalancedLocal(gamma_l,kappa,nu);
H = CBlift(B,p); HL_2 = H(localRow:end,:);
