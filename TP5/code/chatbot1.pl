% Knowledge Base
% Define facts and rules related to the customer support domain

% Knowledge about common issues and their solutions
solution(issue1, 'Please try restarting your device.').
solution(issue2, 'Make sure you are connected to the internet.').
solution(issue3, 'Update your software to the latest version.').
% ... add more issues and solutions

% Knowledge about greetings and farewells
greeting(['Hello!', 'Hi there!', 'How can I assist you today?']).
farewell(['Thank you for contacting us.', 'Have a great day!', 'Goodbye!']).

% Rules for responding to user queries
response(Input, Output) :-
    % Greetings
    (greeting(Greetings), member(Input, Greetings), !, random_response(Greetings, Output));

    % Farewells
    (farewell(Farewells), member(Input, Farewells), !, random_response(Farewells, Output));

    % Handling specific issues
    (solution(Issue, Solution), atom_contains_case_insensitive(Input, Issue), Output = Solution);

    % Default response
    Output = 'I\'m sorry, but I couldn\'t understand your query. Can you please rephrase it?'.

% Utility predicate to check if an atom contains a substring in a case-insensitive manner
atom_contains_case_insensitive(Atom, Substring) :-
    atom_codes(Atom, AtomCodes),
    atom_codes(Substring, SubstringCodes),
    append(_, Rest, AtomCodes),
    append(SubstringCodes, _, Rest).

% Utility predicate to select a random response from a list
random_response(List, Response) :-
    length(List, Length),
    random(0, Length, Index),
    nth0(Index, List, Response).

% Entry point for the chatbot
chatbot :-
    write('Hello! How can I assist you today?'), nl,
    chat_loop.

% Main loop for user interaction
chat_loop :-
    read_line_to_codes(user_input, InputCodes),
    atom_codes(InputAtom, InputCodes),
    atom_string(InputAtom, Input),
    process_input(Input),
    chat_loop.

% Process user input and generate response
process_input(Input) :-
    response(Input, Output),
    write(Output), nl.
