-module(utilities).
-export([sum/2, greeting/1]).

sum(A, B) ->
    A + B.

greeting(Nome) ->
    "Hello, " ++ Nome ++ "!".