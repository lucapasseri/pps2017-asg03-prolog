% size(List,Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..
size([], zero).
size([_|T], s(N)) :- size(T, N).


% sum(List,Sum)
sum([], 0).
sum([H|T], S) :- sum(T, N), S is H+N.


% average(List,Average)
% it uses average(List,Count,Sum,Average)
average(List,A) :- average(List,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :-
	C2 is C+1,
	S2 is S+X,
	average(Xs,C2,S2,A).


% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max([H], H).
max([H|T], H) :- max(T, N), H>N.
max([H|T], N) :- max(T, N), H=<N.