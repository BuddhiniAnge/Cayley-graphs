# usage: PrintHamCycle(subgroup1,subgroup2,isomorphism_type,generating_set);

PrintHamCycle:=function(arg)

global g1,g2,k1,k2;

g1:=arg[1]; #cyclic subgroup (not normal) which is a factor of the semidirect product
g2:=DirectProduct(arg[2],arg[2]); #subgroup (normal) which is a factor of the semidirect product
k1:=arg[3]; #which automorphism from the automorphisms list is to be selected
k2:=arg[4]; #which generating set is to be selected

g1gen:=GeneratorsOfGroup(g1)[1];

Auts:=AutomorphismGroup(g2);

AutsOfOrdq:=Filtered(Elements(Auts),elt->Order(elt)=Order(g1));

ExHom:=GroupHomomorphismByImages(g1,Auts,[g1gen],[AutsOfOrdq[k1]]);

s:=SemidirectProduct(g1,ExHom,g2);

Read("UndirectedGeneratingSets.gap");

S:=IrredUndirGenSetsUpToAut(s);

SForGraph:=S[k2];

LoadPackage("grape");

X:=CayleyGraph(s,SForGraph);

Display(X);
