# usage: PrintHamCycle(subgroup1,subgroup2,isomorphism_type,generating_set);

PrintHamCycle:=function(arg)

local f,g,m,k,k1,gen,Auts,AutsOfOrdq,ExHom,s,S,M,X1,A1;

f:=arg[1]; #cyclic subgroup (not normal) which is a factor of the semidirect product
m:=arg[2]; #subgroup (normal) which is a factor of the semidirect product
k:=arg[3]; #which automorphism from the automorphisms list is to be selected
k1:=arg[4]; #which generating set is to be selected

s:=[]; 

S:=[];

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

S:=IrredUndirGenSetsUpToAut(s);

M:=S[1];
if Order(M[1])=Order(M[2]) then
M:=S[2];
else
M:=S[1];
fi;

X1:=CayleyGraph(s,M);

A1:=AdjacencyMatrixCayleyGraph(Elements(s),M);

PlotGraph(A1));

if Order(M[1])=Size(m) then
t1:=M[1]; 
s1:=M[2];
else
t1:=M[2];
s1:=M[1];
fi;

S2:=IrredUndirGenSetsUpToAut(g);

if S2[1]=t1 then
u1:=S2[2]; #we have to check for powers of t1 also (check later)
else 
u1:=S2[2];
fi;

B1:=[];
For i in [1..Size(m)-2] do
B1[i]:=[t1^i,t1^{i+1}]
i:=i+2;
od;

B2:=[];C1:=[];D1:=[];
For i in [1..Floor(Size(m)/2] do
B2[i]:=[u1^i,s1*u1^i];
For j in [1..Size(m)-2] do
C1[j]:=[t1^j*u1^i,t1^{j+1}*u1^i];
D1[j]:=[t1^j*s1*u1^i,t1^{j+1}*s1*u1^i];
j:=j+2;
od;
od;

For i in [Floor(Size(m)/2)+1..2*Floor(Size(m)/2)] do
B3[i]:=[u1^Floor(Size(m)/2)+1}..s1*u1^{2*Floor(Size(m)/2)}]
od;




end;
