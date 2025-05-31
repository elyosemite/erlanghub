%% src/hello_world.erl
-module(hello_world).
-export([say/0]).

say() ->
    io:format("Hello, World!~n"),
    second().

second() ->
    io:format("Hello from Erlang!~n").