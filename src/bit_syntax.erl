-module(bit_syntax).
-export([encode_pair/2]).

%% 1. Encode two 8-bit integers into a binary
encode_pair(A, B) when A >= 0, A < 256, B >= 0, B < 256 ->
    <<A:8, B:8>>.