% Relationships
parent(john, mary).
parent(john, jenny).
parent(peter, john).
parent(mary, anna).
parent(mary, kate).
parent(paul, jenny).
parent(paul, luke).
parent(joseph, peter).
parent(emily, peter).

% Gender
male(john).
male(peter).
male(paul).
male(joseph).
male(luke).

female(mary).
female(jenny).
female(anna).
female(kate).
female(emily).

% Rules
father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
child(Child, Parent) :- parent(Parent, Child).
son(Child, Parent) :- child(Child, Parent), male(Child).
daughter(Child, Parent) :- child(Child, Parent), female(Child).

grandparent(GP, GC) :- parent(GP, X), parent(X, GC).
grandmother(GM, GC) :- grandparent(GM, GC), female(GM).
grandfather(GF, GC) :- grandparent(GF, GC), male(GF).
grandchild(GC, GP) :- grandparent(GP, GC).
grandson(GS, GP) :- grandchild(GS, GP), male(GS).
granddaughter(GD, GP) :- grandchild(GD, GP), female(GD).

spouse(Husband, Wife) :- parent(Husband, Child), parent(Wife, Child), Husband \= Wife.
husband(Person, Wife) :- spouse(Person, Wife), male(Person).
wife(Person, Husband) :- spouse(Husband, Person), female(Person).

sibling(Person1, Person2) :- parent(Parent, Person1), parent(Parent, Person2), Person1 \= Person2.
brother(Person, Sibling) :- sibling(Person, Sibling), male(Person).
sister(Person, Sibling) :- sibling(Person, Sibling), female(Person).

% Additional Rules
aunt(Aunt, Person) :- parent(Parent, Person), sister(Aunt, Parent).
uncle(Uncle, Person) :- parent(Parent, Person), brother(Uncle, Parent).
nephew(Nephew, Person) :- child(Nephew, Parent), sibling(Parent, Person), male(Nephew).
niece(Niece, Person) :- child(Niece, Parent), sibling(Parent, Person), female(Niece).

cousin(Person1, Person2) :- parent(Parent1, Person1), parent(Parent2, Person2), sibling(Parent1, Parent2).
first_cousin(Person1, Person2) :- cousin(Person1, Person2), parent(Parent1, Person1), parent(Parent2, Person2), Parent1 \= Parent2.
first_cousin_once_removed(Person1, Person2) :- cousin(Person1, X), parent(X, Person2), Person1 \= Person2.
first_cousin_twice_removed(Person1, Person2) :- cousin(Person1, X), parent(X, Y), parent(Y, Person2), Person1 \= Person2.

% Examples:
% ?- father(john, mary).
% true.
%
% ?- mother(mary, anna).
% true.
%
% ?- son(luke, paul).
% true.
%
% ?- grandparent(joseph, anna).
% true.
%
% ?- spouse(peter, emily).
% true.
%
% ?- brother(john, jenny).
% false.
%
% ?- nephew(jenny, peter).
% true.
%
% ?- cousin(jenny, luke).
% true.
%
% ?- first_cousin(anna, luke).
% false.
%
% ?- first_cousin_once_removed(joseph, luke).
% true.
