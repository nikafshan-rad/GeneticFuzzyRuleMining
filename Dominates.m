function flag=Dominates(x,y)

    if isfield(x,'Cost')
        x=x.Cost;
    end
    
    if isfield(y,'Cost')
        y=y.Cost;
    end    

    flag=all(x<=y) && any(x<y);

end