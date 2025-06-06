-module(hello_world).

-export([say/0, my_age/0, my_name/0, process_credit_card_payment/0,
         process_debit_card_payment/0, my_favorite_colors/0, describe/1, double_each/1,
         filter_even/1, square_recursive/1, flatten/1]).

to_string_and_length(Str) when is_list(Str) ->
    {Str, length(Str)};

fall_velocity(Distance) ->
    math:sqrt(2 * 9.8 * Distance).

say() ->
    io:format("Hello, World!~n"),
    io:format("Number: ~p~n", [fall_velocity(10)]),
    second().

second() ->
    io:format("Hello from Erlang!~n").

my_age() ->
    27.

my_name() ->
    utilities:greeting("El Yosemite").

process_credit_card_payment() ->
    {ok, "Success"}.

process_debit_card_payment() ->
    {fail, "You don't have limit"}.

my_favorite_colors() ->
    ["blue", "green", "white", "black"].

%% pattern match different types
describe(Value) when is_atom(Value) ->
    "You gave me an atom.";
describe(Value) when is_integer(Value) ->
    "It's an integer.";
describe(Value) when is_list(Value) ->
    "It's a list.";
describe(Value) when is_tuple(Value) ->
    "A tuple!";
describe(_) ->
    "Unknown type.".

%% 1. Map: Double each number using list comprehension
double_each(List) ->
    [X * 2 || X <- List].

%% 2. Filter: Only even numbers using list comprehension
filter_even(List) ->
    [X || X <- List, X rem 2 == 0].

%% 3. Recursive: Square each element
square_recursive([]) ->
    [];
square_recursive([H | T]) ->
    [H * H | square_recursive(T)].

%% 4. Flatten: Turn nested list into flat list
flatten([]) ->
    [];
flatten([H | T]) when is_list(H) ->
    flatten(H) ++ flatten(T);
flatten([H | T]) ->
    [H | flatten(T)].
