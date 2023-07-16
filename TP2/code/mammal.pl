% FACTS.
mammal(kitty).
mammal(ratatat).
mammal(fido).
claws(kitty).
tail(ratatat).
bestfriend(fido).
feathers(tweety).

% If X is a mammal then X has fur.
has_fur(X) :- mammal(X).

% If X has fur and X has a tail then X is a rat.
rat(X) :- mammal(X), has_fur(X), tail(X).



% If X has claws and X has fur then X is a cat.
cat(X) :- claws(X), has_fur(X).

% If X is a cat then X meows.
meows(X) :- cat(X).

% If X has feathers then X is a bird.
is_bird(X) :- feathers(X).

% If X is a bestfriend and X has fur then X is a dog.
is_dog(X) :- bestfriend(X) , has_fur(X).

% If X is a dog and Y meows then X likes Y.
likes(X,Y) :- is_dog(X) , meows(Y).

% If X is a cat and Y is a bird then X likes Y.
likes(X,Y) :- cat(X) , is_bird(Y).

% If X is a cat and Y is a rat then X likes Y.
likes(X,Y) :- cat(X) , rat(Y).
