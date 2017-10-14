function w=Tournament(pop)

global nTournament;
h=randsample(numel(pop),nTournament);
[CostOrder,o]=min([pop(h).Cost]);
w=h(o);
end
 