# usage: CoordinatesOfArray(group,array);
CoordinatesOfArray:=function(arg)
local f,g,leng,V,L1,L2,R,proj,e1,e2,i,L11,L22;
  f:=arg[1]; #Semidirect product group
  g:=arg[2]; #array
  leng:=Size(g);

  V:=g;

  proj:=Projection(f);

  e1:=Embedding(f,1);
  e2:=Embedding(f,2);

  L1:=[];;
  L2:=[];;
  R:=[];;

  for i in [1..leng] do
   L1[i]:=Image(proj,V[i]);
   L2[i]:=PreImagesRepresentative(e2,Image(e1,Image(proj,V[i]))^-1*V[i]);
   R[i]:=[L1[i],L2[i]];
  od;

Display(L1);
Display(L2);
Display(R);
end;
