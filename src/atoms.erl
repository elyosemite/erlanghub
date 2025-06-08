-module(atoms).
-export([i_have_atom/1]).

i_have_atom(MyAtom) ->
    io:format([MyAtom, " is an atom!~n"]),
    case is_atom(MyAtom) of
        true -> 
            io:format("Yes, ~p is an atom!~n", [MyAtom]);
        false -> 
            io:format("No, ~p is not an atom!~n", [MyAtom])
    end.