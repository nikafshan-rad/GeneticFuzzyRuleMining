function su=overlap(x)
su=0;
for i=0:3
    a=x(1,6*i+1)-x(1,6*i+2);
    b=x(1,6*i+1)+x(1,6*i+2);
    c=x(1,6*i+3)-x(1,6*i+4);
    d=x(1,6*i+3)+x(1,6*i+4);
    z=a:1:b;
    y=c:1:d;
    over=sum(intersect(z,y));
    w=min(x(1,6*i+2),x(1,6*i+4));
    s1=max((over/w),1)-1;
    a=x(1,6*i+1)-x(1,6*i+2);
    b=x(1,6*i+1)+x(1,6*i+2);
    c=x(1,6*i+5)-x(1,6*i+6);
    z=a:1:b;
    y=c:1:24;
    over=sum(intersect(z,y));
    w=min(x(1,6*i+2),x(1,6*i+4));
    s2=max((over/w),1)-1;
    a=x(1,6*i+3)-x(1,6*i+4);
    b=x(1,6*i+3)+x(1,6*i+4);
    c=x(1,6*i+5)-x(1,6*i+6);
    z=a:1:b;
    y=c:1:24;
    over=sum(intersect(z,y));
    w=min(x(1,6*i+2),x(1,6*i+4));
    s3=max((over/w),1)-1;
    su=s1+s2+s3+su;
end

end



