# usage: AdjacencyMatrixCayleyGraph(elms,gens);
AdjacencyMatrixCayleyGraph:=function(elms,gens)
local g,A,i,l;

l:=Length(elms);#input first argument as Elements(s), where s is the semidirect product group
A:=NullMat(l,l);

for i in [1..Length(elms)] do
for g in gens do
A[i][Position(elms,elms[i]*g)]:=1;
A[i][Position(elms,elms[i]/g)]:=1;
od;
od;

return A;
end;
