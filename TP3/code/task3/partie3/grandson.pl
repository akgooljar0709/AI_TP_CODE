% Facts defining father-child relationship
father(jack, john).
father(jack, peter).
father(jack, sam).
father(john, jacob).
father(john, david).
father(michael, luke).
father(michael, sarah).
father(david, emma).

% Brother predicate
brother(X, Y) :-
    father(Z, X),       % X and Z share the same father
    father(Z, Y),       % Y and Z share the same father
    X \= Y.             % X and Y are different individuals
	
grandson(X, Y) :-
    father(Y, Z),       % Y is the father of Z
    father(Z, X).       % Z is the father of X

descendent(X, Y) :-
    father(Y, X).  % X is a direct descendant of Y

descendent(X, Y) :-
    father(Y, Z),      % Y is the father of Z
    descendent(X, Z).  % X is a descendant of Z
