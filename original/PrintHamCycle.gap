# usage: PrintHamCycle(subgroup1,subgroup2,isomorphism_type,generating_set);
#For groups of the form $(\mathbb{Z}_p \times \mathbb{Z}_p) \rtimes \mathbb{Z}_q$

PrintHamCycle:=function(arg)

local f,g,m,k,k1,gen,Auts,AutsOfOrdq,ExHom,s,S,M,X1,A1;

f:=arg[1]; #cyclic subgroup (not normal) which is a factor of the semidirect product
m:=arg[2]; #subgroup $\mathbb{Z}_p$ (factor of the normal subgroup, which is a factor of the semidirect product)
k:=arg[3]; #which automorphism from the automorphisms list is to be selected
k1:=arg[4]; #which generating set is to be selected

LoadPackage("grape");
LoadPackage("JupyterViz");
Read("original/AdjacencyMatrixCayleyGraph.gap");
Read("original/UndirectedGeneratingSets.gap");

g:=DirectProduct(m,m);

gen:=GeneratorsOfGroup(f)[1];

Auts:=AutomorphismGroup(g);

AutsOfOrdq:=Filtered(Elements(Auts),elt->Order(elt)=Order(f));

ExHom:=GroupHomomorphismByImages(f,Auts,[gen],[AutsOfOrdq[k]]);

s:=SemidirectProduct(f,ExHom,g);

S:=IrredUndirGenSetsUpToAut(s);

M:=S[k1];

X1:=CayleyGraph(s,M);
Display(X1);

A1:=AdjacencyMatrixCayleyGraph(Elements(s),M);
PlotGraph(A1);

end;
