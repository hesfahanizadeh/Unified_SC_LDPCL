/****************************************************************************************/
/* Target: Enumeration of cycles for SC codes           */
/* By: Homa Esfahanizadeh (homaesf@mit.edu)             */
/* Update: 09/13/2021                                   */
/****************************************************************************************/

% cycle-4 and cycle-6 enumeration

clc
%clear all
close all

%% Code QC Matrix Construction

gamma = 3; % column weight
kappa = 11; % row weight
p = 1;
L = 5; % coupling length

%% Generate Permutation matrix

% Perm = zeros ( gamma , kappa );
% for i = 0:(gamma-1)
%     for j = 0:(kappa-1)
%         Perm( i+1 , j+1 ) = mod ( i * j , p );
%     end
% end
% Perm = randi([0 p-1], gamma , kappa);
Perm = zeros ( gamma , kappa );
for i = 0:(gamma-1)
    for j = 0:(kappa-1)
        Perm( i+1 , j+1 ) = mod ( 6 * i * j , p );
    end
end

% Generate Partitioning Matrix
%PR = [0,0,0,0,1,1,1,1,1,1,1;...
%      0,0,0,0,0,0,0,0,1,1,1]
PR = CandidatesWithTradeoff{6};
% PR = [0  1  0  1  0  1  0  1  0  1  1;...
%       1  0  1  0  1  0  1  0  1  0  0;... 
%       0  0  0  0  1  0  1  1  1  1  1;...
%       0  0  0  0  0  0  0  0  0  0  0;... 
%       0  0  0  0  0  0  0  0  0  0  0]; %LBO

%% Generate the Code

H = ones(gamma*(L+1),kappa*L) * -1;

H_0 = ones(gamma,kappa) * -1;
H_1 = ones(gamma,kappa) * -1;
for i = 0:(gamma-1)
    for j = 0:(kappa-1)
        pow = Perm ( i+1 , j+1 );
        if ( PR(i+1,j+1) == 0 )
            H_0(i+1,j+1) = pow;
        else
            H_1(i+1,j+1) = pow;
        end
    end
end
for i=1:L
    H((i-1)*gamma+1:i*gamma,(i-1)*kappa+1:i*kappa) = H_0;
    H(i*gamma+1:(i+1)*gamma,(i-1)*kappa+1:i*kappa) = H_1;
end

B = [ 1 1 1 0 0 0 0 0 0 0 0;... 
      1 1 1 1 1 1 1 1 1 1 1;...
      1 1 1 1 1 1 1 1 1 1 1];
H = ones(gamma,kappa) * -1;
for i = 0:gamma-1
    for j = 0:kappa-1
        if (B(i+1,j+1)==1)
            H(i+1,j+1) = Perm ( i+1 , j+1 );
        end
    end
end

N = size(H,2);   % number of variable nodes
M = size(H,1);    % number of check nodes

% Cycle-4 Enumeration
C4 = 0;
for j1 = 1:1:N-1
    for j2 = j1+1:1:N
        for i1 = 1:1:M-1
            for i2 = 1:1:M
                if (i1>i2)
                    if (H(i1,j1)>-1 && H(i1,j2)>-1 && H(i2,j1)>-1 && H(i2,j2)>-1)
                        if (mod(H(i1,j1)-H(i1,j2)+H(i2,j2)-H(i2,j1),p)==0)
                            C4 = C4 + p;
                        end
                    end
                end
            end
        end
    end
end

% Cycle-6 Enumeration
C6 = 0;
for j1 = 1:1:N-2
    for j2 = j1+1:1:N-1
        for j3 = j2+1:1:N
            for i1 = 1:1:M
                for i2 = 1:1:M
                    for i3 = 1:1:M
                        if ((i1~=i2)&&(i1~=i3)&&(i2~=i3))
                            if (H(i1,j1)>-1 && H(i1,j2)>-1 && H(i2,j2)>-1 && H(i2,j3)>-1 && H(i3,j3)>-1 && H(i3,j1)>-1)
                                if (mod(H(i1,j1)-H(i1,j2)+H(i2,j2)-H(i2,j3)+H(i3,j3)-H(i3,j1),p)==0)
                                    C6 = C6 + p;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

display ([C4,C6])
