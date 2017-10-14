function cov=coverage(x,u)
zz=[];
for i=0:3
    a=x(1,6*i+1)-x(1,6*i+2);
    b=x(1,6*i+1)+x(1,6*i+2);
    z=a:1:b;
    zz=cat(2,zz,z);
    a=x(1,6*i+3)-x(1,6*i+4);
    b=x(1,6*i+3)+x(1,6*i+4);
    z=a:1:b;
    zz=cat(2,zz,zz);
    a=x(1,6*i+5)-x(1,6*i+6);
    b=x(1,6*i+5)+x(1,6*i+6);
    z=a:1:b;
    zz=cat(2,zz,z);
end
y = sort(zz);
y = y([true diff(y)~=0]);
y=max(y)-min(y);
cov=max(u)/y;
end
    
    