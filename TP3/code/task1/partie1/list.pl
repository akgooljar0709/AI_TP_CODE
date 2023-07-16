% Base case: The item is the first element of the list
item_in_list(Item, [Item|_]).

% Recursive case: The item is not the first element of the list
item_in_list(Item, [_|Rest]) :-
    item_in_list(Item, Rest).

% Predicate to prompt the user for a number and check if it is in the list
check_number_in_list(List) :-
    write('Enter a number: '),
    read(Number),
    (   item_in_list(Number, List)
    ->  write('Number is in the list!')
    ;   write('Number is not in the list.')
    ).
