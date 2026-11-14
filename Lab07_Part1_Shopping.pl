member1(X, [X|_]).
member1(X, [_|Tail]) :-
    member1(X, Tail).

conc([], List, List).
conc([X|Tail1], List2, [X|Tail3]) :-
    conc(Tail1, List2, Tail3).

add(X, List, [X|List]).

shopping :-
    shopping_menu([coffee, milk, chocolate, apple, juice]).

shopping_menu(Basket) :-
    nl,
    writeln('** SHOPPING LIST **'),
    writeln('d. display all items.'),
    writeln('a. Add an item to the list.'),
    writeln('e. exit.'),
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    shopping_choice(Choice, Basket).

shopping_choice(d, Basket) :-
    display_items(Basket),
    shopping_menu(Basket).

shopping_choice(a, Basket) :-
    write('Enter the item you want to add: '),
    read(Item),
    append(Basket, [Item], NewBasket),
    writeln('The item has been added.'),
    shopping_menu(NewBasket).

shopping_choice(e, _) :-
    writeln('Goodbye!').

shopping_choice(_, Basket) :-
    writeln('Invalid choice.'),
    shopping_menu(Basket).

display_items([]).
display_items([Head|Tail]) :-
    writeln(Head),
    display_items(Tail).
