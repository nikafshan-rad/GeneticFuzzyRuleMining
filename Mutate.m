function y=Mutate(x)
x1=x;
R1 = ceil(rand(1,1)*4);
R2 = ceil(rand(1,1)*3);
x1=reshape(x1,6,[]);
x1=x1';
c=x1(R1,:);
m=max(c);
R3 = ceil(rand(1,1)*m);
if(R2==1)
    c(1,1)=R3;
else if(R2==2)
        c(1,3)=R3;
    else
        c(1,5)=R3;
    end
end
cc=cat(2,c(1,1),c(1,3),c(1,5));
[m,IX] = sort(cc);
cc=cat(2,m(1,1),c(1,2),m(1,2),c(1,4),m(1,3),c(1,6));
if(R1==1)
    y=cat(2,cc,x1(2,:),x1(3,:),x1(4,:));
else if(R1==2)
        y=cat(2,x1(1,:),cc,x1(3,:),x1(4,:));
    else if(R1==3)
            y=cat(2,x1(1,:),x1(2,:),cc,x1(4,:));
        else
            y=cat(2,x1(1,:),x1(2,:),x1(3,:),cc);
        end
    end
end

end