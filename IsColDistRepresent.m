function IsRepresentive = IsColDistRepresent(d,gamma)
IsNotRepresentive = true;
if(gamma == 2)
    IsNotRepresentive = d(2) > d(3); 
end
if(gamma == 3)
    perm = [1 2 3 5 7 6 4 8];
    d = d(perm);
    IsNotRepresentive = d(2) > d(3) || d(3) > d(4) || ...
                        (d(2) == d(3) && d(5) > d(6)) || ...
                        (d(3) == d(4) && d(6) > d(7)); 
end
IsRepresentive = ~IsNotRepresentive;
end
