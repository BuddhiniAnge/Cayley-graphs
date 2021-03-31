# usage: PrintHamCycle(subgroup1,subgroup2,isomorphism_type,generating_set);

PrintHamCycle:=function(arg)

local f,g,m,k,k1,gen,Auts,AutsOfOrdq,ExHom,s,N,M,X1,A1;

f:=arg[1]; #cyclic subgroup (not normal) which is a factor of the semidirect product
m:=arg[2]; #subgroup (normal) which is a factor of the semidirect product
k:=arg[3]; #which automorphism from the automorphisms list is to be selected
k1:=arg[4]; #which generating set is to be selected

s:=[]; 

N:=[];

M:=[];

X1:=[];

LoadPackage("grape"); 
LoadPackage("JupyterViz");
Read("original/UndirectedGeneratingSets.gap");
Read("original/AdjacencyMatrixCayleyGraph.gap");

g:=DirectProduct(m,m);

gen:=GeneratorsOfGroup(f)[1];

Auts:=AutomorphismGroup(g);

AutsOfOrdq:=Filtered(Elements(Auts),elt->Order(elt)=Order(f));

ExHom:=GroupHomomorphismByImages(f,Auts,[gen],[AutsOfOrdq[k]]);

s:=SemidirectProduct(f,ExHom,g);

N:=IrredUndirGenSetsUpToAut(s);

M:=N[k1];

X1:=CayleyGraph(s,M);

A1:=AdjacencyMatrixCayleyGraph(Elements(s),M);

Display(PlotGraph(A1));

end;
