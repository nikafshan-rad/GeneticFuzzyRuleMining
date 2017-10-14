function [fit suit a]=Fitness(Pop)
global nvar;
global noTran;
global Trans;
x=0:1:max(Pop);
result.low(1,:)=trimf(x,[Pop(1,1)-Pop(1,2) Pop(1,1) Pop(1,3)]);
result.middle(1,:)=trimf(x,[Pop(1,1) Pop(1,3) Pop(1,5)]);
result.high(1,:)=trapmf(x,[Pop(1,3) Pop(1,5) max(Pop(1,:)) max(Pop(1,:))]);
result.low(2,:)=trimf(x,[Pop(1,7)-Pop(1,8) Pop(1,7) Pop(1,9)]);
result.middle(2,:)=trimf(x,[Pop(1,7) Pop(1,9) Pop(1,11)]);
result.high(2,:)=trapmf(x,[Pop(1,9) Pop(1,11) max(Pop(1,:)) max(Pop(1,:))]);
result.low(3,:)=trimf(x,[Pop(1,13)-Pop(1,14) Pop(1,13) Pop(1,15)]);
result.middle(3,:)=trimf(x,[Pop(1,13) Pop(1,15) Pop(1,17)]);
result.high(3,:)=trapmf(x,[Pop(1,15) Pop(1,17) max(Pop(1,:)) max(Pop(1,:))]);
result.low(4,:)=trimf(x,[Pop(1,19)-Pop(1,20) Pop(1,19) Pop(1,21)]);
result.middle(4,:)=trimf(x,[Pop(1,19) Pop(1,21) Pop(1,23)]);
result.high(4,:)=trapmf(x,[Pop(1,21) Pop(1,23) max(Pop(1,:)) max(Pop(1,:))]);
%% membership fuction for each Transaction
for j=1:noTran
    for z=1:nvar
        if (Trans(j,z)==0 || Trans(j,z)>size(result.low,2))
            fuzset(j).low(1,z)=0;
            fuzset(j).middle(1,z)=0;
            fuzset(j).high(1,z)=0;
        else
            fuzset(j).low(1,z)=result.low(z,Trans(j,z));
            fuzset(j).middle(1,z)=result.middle(z,Trans(j,z));
            fuzset(j).high(1,z)=result.high(z,Trans(j,z));
        end
    end
end
var=zeros(1,12);
for i=1:noTran
    var(1,1)=fuzset(i).low(1,1)+var(1,1);
    var(1,2)=fuzset(i).low(1,2)+var(1,2);
    var(1,3)=fuzset(i).low(1,3)+var(1,3);
    var(1,4)=fuzset(i).low(1,4)+var(1,4);
end

for i=1:noTran
   var(1,5)=fuzset(i).middle(1,1)+var(1,5);
   var(1,6)=fuzset(i).middle(1,2)+ var(1,6);
   var(1,7)=fuzset(i).middle(1,3)+ var(1,7);
   var(1,8)=fuzset(i).middle(1,4)+ var(1,8);
end
for i=1:noTran
   var(1,9)=fuzset(i).high(1,1)+var(1,9);
   var(1,10)=fuzset(i).high(1,2)+var(1,10);
   var(1,11)=fuzset(i).high(1,3)+var(1,11);
   var(1,12)=fuzset(i).high(1,4)+var(1,12);
end
S = var>400;
a=max(var(S));
x=Pop;
z1=overlap(x);
z2=coverage(x,Trans(j,:));
suit=z1+z2;
fit=a/suit;
if(isempty(fit))
    fit=0;
end

end