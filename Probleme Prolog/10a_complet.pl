% Predicate to insert an element at a specific position in a list
% insert(List1, List2, Element, Position)

% If the position is greater than the length of the list, return the original list.
insert(List, List, _, Position) :- length(List, L), Position > L.

% Base case: When the position is 1, insert the element and continue.
insert(List, [Element|List], Element, 1).

% Recursive case: Keep the head of the list and decrement the position.
insert([Head|Tail1], [Head|Tail2], Element, Position) :-
    Position > 1,
    Position1 is Position - 1,
    insert(Tail1, Tail2, Element, Position1).
