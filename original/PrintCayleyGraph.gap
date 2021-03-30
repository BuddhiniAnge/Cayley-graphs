# usage: PrintCayleyGraph(filename,group[,generatornames]);
PrintCayleyGraph:=function(arg)
local f,g,gens,ngens,epi,r,nams,nnams,vert,kind,p,i,j,e,ed;
  f:=arg[1];
  g:=arg[2];
  gens:=GeneratorsOfGroup(g);
  r:=Length(gens);
  if Length(arg)>2 then
    nams:=arg[3];
  else
    nams:=List([1..r],x->CHARS_LALPHA{[x]});
  fi;
  ngens:=[];
  nnams:=[];
  kind:=[]; # what kind of arrow
  for i in [1..r] do
    if Order(gens[i])=2 then
      kind[i]:=2;
      Add(ngens,gens[i]);
      Add(nnams,nams[i]);
    else
      p:=Position(gens,gens[i]^-1);
      if p<i then
        kind[i]:=-p;
      else
        kind[i]:=1;
        Add(ngens,gens[i]);
        Add(nnams,nams[i]);
      fi;
    fi;
  od;
  gens:=ngens;
  g:=GroupWithGenerators(gens);
  epi:=EpimorphismFromFreeGroup(g:names:=nnams);
  PrintTo(f,"digraph cayley {\nsize = \"6,6\";\n");
  e:=Elements(g);
  e:=ShallowCopy(e);
  if IsPermGroup(g) then
    SortBy(e,x->1^x);
  fi;
  vert:=List([1..Length(e)],x->Concatenation("\"v",String(x),"\""));
  for i in [1..Length(e)] do
    if IsOne(e[i]) then
      p:="1";
    else
      p:=String(Factorization(g,e[i]));
    fi;
    AppendTo(f,vert[i]," [label=\"",i,":",p,"\"\];\n");
  od;
  ed:=[];
  for i in [1..Length(e)] do
    for j in [1..Length(gens)] do
      p:=Position(e,e[i]*gens[j]);
      if kind[j]=1 then
        Add(ed,[Set([i,p]),i,p,Concatenation("[label=\"",nams[j],"\"];\n")]);
      elif kind[j]=2 and p>i then
        Add(ed,[Set([i,p]),i,p,
        Concatenation("[label=\"",nams[j],"\",arrowhead=none];\n")]);
      fi;
    od;
  od;
  Sort(ed); # to try to get same shape
  for i in ed do
    AppendTo(f,"  ",vert[i[2]]," -> ",vert[i[3]],i[4]);
  od;

  AppendTo(f,"}\n");
end;
