my_list([apple, banana, orange, mango, grape]).

append_item(Item, Result) :-
    my_list(List),
    append(List, [Item], Result).
