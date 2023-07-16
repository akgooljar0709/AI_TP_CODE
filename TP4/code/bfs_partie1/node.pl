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

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

