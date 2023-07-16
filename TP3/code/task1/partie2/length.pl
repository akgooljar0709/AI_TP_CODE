numbers_list([1, 2, 3, 4, 5, 6]).

calculate_list_length(Length) :-
    numbers_list(List),
    length(List, Length).
