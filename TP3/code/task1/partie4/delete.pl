my_list([a, b, c, d, e]).

delete_item(Item, Result) :-
    my_list(List),
    delete(List, Item, Result).
