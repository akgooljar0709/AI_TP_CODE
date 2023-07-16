edge(a, b).
edge(b, c).
edge(b, d).
edge(c, e).
edge(d, f).
edge(e, g).
edge(e, h).
edge(f, i).
edge(g, i).
edge(h, j).
edge(i, k).
edge(j, k).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

dfs(Node, Node, _, [Node]).
dfs(Start, Node, Visited, [Start|Path]) :-
    connected(Start, Next),
    \+ member(Next, Visited),
    dfs(Next, Node, [Next|Visited], Path).

path(Start, End, Path) :-
    dfs(Start, End, [Start], Path).
