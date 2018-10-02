% same(List1,List2)
% are the two lists the same?
same([],[]).
same([X|Xs],[X|Ys]):- same(Xs,Ys).


% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).
all_bigger([X],[Y]) :- X>Y.
all_bigger([X|Xs],[Y|Ys]) :- all_bigger(Xs, Ys), X>Y. 


% sublist(List1,List2)
% List1 should be a subset of List2
% example: sublist([1,2],[5,3,2,1]).
sublist([H], L) :- search(H, L).
sublist([H|T], L) :- search(H, L), sublist(T, L).


% seq(N,List)
% example: seq(5,[0,0,0,0,0]).
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).


% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).
seqR(0,[0]).
seqR(N,[N|T]) :- N>0, N2 is N-1, seqR(N2,T).


% last(L1, N, L2)
% example: last([1,2,3],5,[1,2,3,5]).
last([], N, [N]).
last([H|T], N, [H|T2]) :- last(T, N, T2).


% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).
seqR2(0,[0]).
seqR2(N,L) :- N>0, N2 is N-1, seqR2(N2,L2), last(L2, N, L).


% inv(List,List)
% example: inv([1,2,3],[3,2,1]).
inv([], []).
inv([H|T], R) :- inv(T, R2), last(R2, H, R).


% double(List,List)
% suggestion: remember predicate append/3
% example: double([1,2,3],[1,2,3,1,2,3]).
double(L, D) :- append(L, L, D).


% times(List,N,List)
% example: times([1,2,3],3,[1,2,3,1,2,3,1,2,3]).
times(L, 2, T) :- double(L, T).
times(L, N, T) :- N>2, N2 is N-1, times(L, N2, T2), append(T2, L, T).


% proj(List,List)
% example: proj([[1,2],[3,4],[5,6]],[1,3,5]).
proj([], []).
proj([[H|_]|T], [H|T2]) :- proj(T, T2).