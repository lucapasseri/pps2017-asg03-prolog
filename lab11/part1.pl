% dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).

% dropFirst(?Elem,?List,?OutList)
dropFirst(X,[X|T],T) :- !.
dropFirst(X,[H|Xs],[H|L]) :- dropFirst(X,Xs,L).

% dropLast(?Elem,?List,?OutList)
dropLast(X,[X|T],[X|L]) :- dropLast(X, T, L), !.
dropLast(X,[X|T],T).
dropLast(X,[H|Xs],[H|L]) :- dropLast(X,Xs,L).

% dropAll(?Elem,?List,?OutList)
dropAll(E, [], []).
dropAll(E, [E|Xs], Ys) :- dropAll(E, Xs, Ys), !.
dropAll(E, [H|T], [H|Ys]) :- dropAll(E, T, Ys).

% fromList(+List,-Graph)
fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

% fromCircList(+List,-Graph)
fromCircList([H|T], O) :- fromCircList(H, [H|T], O).
fromCircList(H, [H1], [e(H1, H)]).
fromCircList(H, [H1,H2|T],[e(H1,H2)|L]):- fromCircList(H, [H2|T], L).

% dropNode(+Graph, +Node, -OutGraph)
% drop all edges starting and leaving from a Node
% use dropAll defined in 1.1
dropNode(G,N,O):- dropAll(G,e(N,_),G2),
dropAll(G2,e(_,N),O).