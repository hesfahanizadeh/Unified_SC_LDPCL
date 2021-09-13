function S = SMatrix(l,i)
if (i<0 || i>=l)
    error('Invalid value for i');
end
if(i == 0 )
    S = [];
else
    S = [fliplr(1-eye(i)); ones(l-i,i)];
end
end

