function IsValid = IsColDistValid(d,gamma)
IsNotValid = true;
if(gamma == 2)
    IsNotValid = d(2) == 0 && d(4) == 0; 
end
if(gamma == 3)
    perm = [1 2 3 5 7 6 4 8];
    d = d(perm);
    IsNotValid = d(8) == 0 &&...
        (sum(d([2 6 7])) == 0 ||...
         sum(d([3 5 7])) == 0 ||...
         sum(d([4 5 6])) == 0);
end
IsValid = ~IsNotValid;
end
