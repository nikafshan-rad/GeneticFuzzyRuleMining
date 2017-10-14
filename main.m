close all;
clear;
clc;
%% setup operation
global npop;
global nvar;
global noTran;
global Trans;
global nTournament;
npop=50;
nvar=4;
noTran=1000;
MaxIt=500;
nTournament=2;

pCrossover=0.8;
nCrossover=round(pCrossover*npop/2)*2;

pMutation=0.01;
nMutation=round(pMutation*npop);
tic
tstart=tic;

%% generate Transaction Database
for j=1:noTran
    Trans(j,:)=randint(1,nvar,[0 10]);
end

%% fuzzy rule generate
for j=1:npop
    for i=1:nvar
        pop(j).pop(i,:)=randint(1,2,[1 6]);
    end    
end

for j=1:npop
    c=[];
    for i=1:4
        fuzstruct(i,:)=[pop(j).pop(i,1) pop(j).pop(i,2) pop(j).pop(i,1)+pop(j).pop(i,2) pop(j).pop(i,2) pop(j).pop(i,1)+pop(j).pop(i,2)+pop(j).pop(i,2) pop(j).pop(i,2)];
        c=cat(2,c,fuzstruct(i,:));
    end
    cc(j,:)=c;
end
Pop=cc;
%% Initialization  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
individual.Position=[];
individual.Cost=[];
pop=repmat(individual,npop,1);
% 
% bestpop=zeros(maxit,nvar*6);
% bestcosts=zeros(maxit,1);
tot=toc(tstart);   
for i=1:npop
     pop(i).Position=Pop(i,:);
     tic
     tstart=tic;
     [pop(i).Cost suit a]=Fitness(pop(i).Position);
     t1(i)=toc(tstart);
end
tot=max(t1)+tot;
Tave=mean(t1);
%% generate initial population for every path
tic
tstart=tic;
BestCost=zeros(1,MaxIt);
meanCost=zeros(1,MaxIt);
%%GA main loop
for it=1:MaxIt
    
    %%crossover
   pop2=repmat(individual,nCrossover/2,2);
for k=1:nCrossover/2
       
    
      i1=Tournament(pop);%ceil((nPop-1).*rand(1))+1;
      i2=Tournament(pop);%ceil((nPop-1).*rand(1))+1;
       
       p1=pop(i1);
       p2=pop(i2);
       x=p1.Position;
       y=p2.Position;
       [a b]=Crossover(x,y);
       ch1.Position=a ;
       ch2.Position=b; 
       [ch1.Cost suit a]=Fitness(a);
       [ch2.Cost suit a]=Fitness(b);
      
       pop2(k,1)=ch1;
       pop2(k,2)=ch2;
        
end
       pop2=pop2(:);
    
       %%mutation 
       
       pop3=repmat(individual,nMutation,1);
    for k=1:nMutation
        
        i3=Tournament(pop);%ceil((nPop-1)*rand(1)+1);
        yy=pop(i3).Position;
        q=Mutate(yy);
        p.Position=q;
        [p.Cost suit a]=Fitness(q);
              
        pop3(k)=p;      
    end
        
     %%merg population
      pop1=[pop 
           pop2  
           pop3];
    
     %%sort
     for i=1: size(pop1,1)
      Costs(i,:)=pop1(i).Cost;
     end
             
     
    [Costs  Sort_Order]=sort(Costs,'descend');   %% descending order
    pop1=pop1(Sort_Order);
    pop1=pop1(1:npop);                 %%delete extra individuals
to=toc(tstart);
tot=to+tot;
    for i=1:npop
         tic
         tstart=tic;
         [u1(i) suitability(i) Litem(i)]=Fitness(pop1(i).Position); 
         t1(i)=toc(tstart);
    end
tic
tstart=tic;
    T(it)=max(t1);
    BestFitness(it)=max(u1);
    MeanFitness(it)=mean(u1);
      
    BestSol(it,:)=pop1(1).Position;
    BestCost(it)=pop1(1).Cost;
    pop=pop1;  

  disp(['iteration: ' num2str(it) ' -Best Cost : ' num2str(pop1(1).Cost) ' -Best Fitness : ' num2str(BestFitness(it)) ' -Mean Fitness : ' num2str(MeanFitness(it))]);
to=toc(tstart);
tot=to+tot;
end
t=max(T);
Time=tot+t;

figure(1);
plot(BestFitness,'g-','Linewidth',1);
hold on
plot(MeanFitness,'-','LineWidth',1);
legend('Best Fitness','Mean Fitness');
title('Fitness Values');
xlabel('Iteration');
ylabel('Fitness');