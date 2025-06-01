%% src/hello_world.erl
-module(hello_world).

-export([say/0, my_age/0, my_name/0, process_credit_card_payment/0,
         process_debit_card_payment/0, my_favorite_colors/0, describe/1]).

say() ->
    io:format("Hello, World!~n"),
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
