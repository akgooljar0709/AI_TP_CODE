% Facts defining father-child relationship
father(jack, john).
father(jack, peter).
father(jack, sam).
father(john, jacob).
father(john, david).
father(michael, luke).
father(michael, sarah).
father(david, emma).

% Cousin predicate
cousin(X, Y) :-
    father(Z, X),       % X and Z share the same father
    father(W, Y),       % Y and W share the same father
    X \= Y,             % X and Y are different individuals
    father(V, Z),       % Z and V share the same father
    father(V, W),       % W and V share the same father
    Z \= W.             % Z and W are different individuals
