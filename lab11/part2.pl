% reaching(+Graph, +Node, -List)
% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)
reaching(G, N, L) :- findall(X, member(e(N, X), G), L).

% anypath(+Graph, +Node1, +Node2, -ListPath)
% a path from Node1 to Node2
% if there are many path, they are showed 1-by-1
anypath(G,N1,N2,[e(N1,N2)]):-member(e(N1,N2),G).
anypath(G,N1,N2,A):-append([e(N1,N3)],L,A),member(e(N1,N3),G),anypath(G,N3,N2,L), !.

% allreaching(+Graph, +Node, -List)
% all the nodes that can be reached from Node
% Suppose the graph is NOT circular!
% Use findall and anyPath!
allreaching(G,N,X,L):- member(e(_,X),G),anypath(G,N,X,L).
allreaching(G,N,L):-findall(X,allreaching(G,N,X,Y),L).