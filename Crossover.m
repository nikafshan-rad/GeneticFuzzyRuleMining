function [ch1 ch2]=Crossover(p1,p2)
x1=p1;
x2=p2;
x1=reshape(x1,6,[]);
x1=x1';
x2=reshape(x2,6,[]);
x2=x2';
c(1,:)=cat(2,x1(1,:),x2(2,:),x1(3,:),x2(4,:));
c(2,:)=cat(2,x2(1,:),x1(2,:),x2(3,:),x1(4,:));
a=0.7;%rand(1);
b=0.35;%rand(1);
c(3,:)=cat(2,x1(1,:),x2(2,1)+a,x2(2,2),x2(2,3)+a,x2(2,4),x2(2,5)+a,x2(2,6),x1(3,1)+b,x1(3,2),x1(3,3)+b,x1(3,4),x1(3,5)+b,x1(3,6),x2(4,:));
c(4,:)=cat(2,x2(1,:),x1(2,1)-a,x1(2,2),x1(2,3)-a,x1(2,4),x1(2,5)-a,x1(2,6),x2(3,1)-b,x2(3,2),x2(3,3)-b,x2(3,4),x2(3,5)-b,x2(3,6),x1(4,:));
fit11=Fitness(c(1,:));
fit12=Fitness(c(2,:));
fit13=Fitness(c(3,:));
fit14=Fitness(c(4,:));
f=[fit11 fit12 fit13 fit14];
[m,IX] = sort(f,'descend');
ch1=c(IX(1),:);
ch2=c(IX(2),:);
  
end