function Q = QMatrix(l,r,i)
if(i<0 || i>= l)
    error('Invalid value for i');
end
Q = ones(l,r); Q(i+1,:) = 0;
end

