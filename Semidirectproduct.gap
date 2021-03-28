# usage: Semidirectproduct(a,b,c);
Semidirectproduct:=function(arg)
local f,g,fgen,h,i,j,Auts,AutsOfOrder,ExHom,s;
  f:=arg[1]; #Zq subgroup
  g:=arg[2]; #Zp subgroup
  j:=arg[3]; #which element from set of order i automorphism to be selected to form the semidirect product
  i:=Size(f);

  fgen:=GeneratorsOfGroup(f)[1];
  h:=DirectProduct(g,g);

  Auts:=AutomorphismGroup(h);
  AutsOfOrder:=Filtered(Elements(Auts),elt->Order(elt)=i);

  ExHom:=GroupHomomorphismByImages(f,Auts,[fgen],[AutsOfOrder[j]]);
  s:=SemidirectProduct(f,ExHom,h);

return s;
end;
