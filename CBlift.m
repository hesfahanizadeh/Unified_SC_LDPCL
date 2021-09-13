function [H,a,b]=CBlift(ProtoH,p)
%Circulant-Based lifting
if(any(ProtoH>1,'all'))
    error('ProtoH should be binary');
end
[m,n] = size(ProtoH);
%% find 0<a,b<p s.t. O(a) = n, O(b) = m in GF(p)
Order = zeros(2,p-1);
for i = 1:(p-1)
    Pow = i; k =0;
    if(gcd(p,i) == 1)
        k =1;
        while (Pow~=1)
            k = k+1;
            Pow = mod(Pow*i,p);
        end
    end
    Order(1,i) = i; Order(2,i) = k;
end
a = find(Order(2,:) == n,1); b = find(Order(2,:) == m,1);
if(isempty(a) || isempty(b))
    error('Protomatrix sizes do not divide phi(p)-1');
end
%% construct H
aVec = mod(a.^(0:(n-1)),p); bVec = mod(b.^(0:(m-1)),p);
[A,B] = meshgrid(aVec,bVec);
P = mod(A.*B,p); %powers matrix
circulantMatrix=repmat(circshift(eye(p),-1,2),m,n);
C = mat2cell(circulantMatrix,p*ones(1,m),p*ones(1,n));
% raise circulants by ProtoH iff H=1, else set zero
for i = 1:m
    for j = 1:n
        C{i,j} = ProtoH(i,j)*C{i,j}^P(i,j);
    end
end
H = sparse(cell2mat(C));


end