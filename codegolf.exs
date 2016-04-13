w = ["Head,","shoulders,","knees and","toes","and eyes","and ears","and mouth and","nose"]
r = ["...,","...,","... ...","...","... ...","... ...","... ... ...","..."]
l = [[1,2,3,4],[3,4],[1,2,3,4],[3,4],[5,6,7,8],[1,2,3,4],[3,4]]
defmodule C do
def g(_,_,[]),do: []
def g(_,0,x),do: x
def g([y|z],n,[_|x]),do: [y|g(z,n-1,x)]
def p([i|[]],j),do: j[i]
def p([i|k],j),do: j[i] <> " " <> p(k,j)
def q([i|[]],j),do: p(i,j)
def q([i|k], j),do: p(i,j) <> "\n" <> q(k,j)
def s(i,j,k,0),do: q(i,Enum.into(Enum.zip([1,2,3,4,5,6,7,8],g(j,8,k)),%{}))
def s(i,j,k,n),do: q(i,Enum.into(Enum.zip([1,2,3,4,5,6,7,8],g(j,8-n,k)),%{})) <> "\n\n" <> s(i,j,k,n-1)
end
IO.puts C.s(l,r,w,8)
