% Base case: When the list has a single element, it is the maximum
max_list([X], X).

% Recursive case: Compare the head of the list with the maximum of the tail
max_list([Head|Tail], Max) :-
    max_list(Tail, TailMax),
    (Head > TailMax -> Max = Head ; Max = TailMax).

% Predicate to find the maximum number in a list
find_max(List, Max) :-
    max_list(List, Max).
