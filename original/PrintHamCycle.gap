# usage: PrintHamCycle(subgroup1,subgroup2,isomorphism_type,generating_set);

PrintHamCycle:=function(arg)

local f,g,m,k,k1,gen,Auts,AutsOfOrdq,ExHom,s,S,SForGraph,X;

f:=arg[1]; #cyclic subgroup (not normal) which is a factor of the semidirect product
m:=arg[2]; #subgroup (normal) which is a factor of the semidirect product
k:=arg[3]; #which automorphism from the automorphisms list is to be selected
k1:=arg[4]; #which generating set is to be selected

g:=DirectProduct(m,m);

gen:=GeneratorsOfGroup(f)[1];

Auts:=AutomorphismGroup(g);

AutsOfOrdq:=Filtered(Elements(Auts),elt->Order(elt)=Order(f));

ExHom:=GroupHomomorphismByImages(f,Auts,[gen],[AutsOfOrdq[k]]);

s:=SemidirectProduct(f,ExHom,g);

Read("UndirectedGeneratingSets.gap");

S:=IrredUndirGenSetsUpToAut(s);

SForGraph:=S[k1];

LoadPackage("grape");

X:=CayleyGraph(s,SForGraph);

Display(X);

end;
