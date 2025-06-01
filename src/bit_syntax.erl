-module(bit_syntax).

-export([encode_pair/2, decode_pair/1, sum_bytes/1, sum_bytes/2, extract_ascii/1,
         extract_ascii/2]).

%% 1. Encode two 8-bit integers into a binary
encode_pair(A, B) when A >= 0, A < 256, B >= 0, B < 256 ->
    <<A:8, B:8>>.

%% 2. Decode binary into a tuple of two integers
decode_pair(<<A:8, B:8>>) ->
    {A, B}.

%%  3. Sum all bytes in a binary
sum_bytes(Bin) ->
    sum_bytes(Bin, 0).

sum_bytes(<<>>, Acc) ->
    Acc;
sum_bytes(<<Byte:8, Rest/binary>>, Acc) ->
    sum_bytes(Rest, Acc + Byte).

%% 4. Extract printable ASCII characters from binary
extract_ascii(Bin) ->
    extract_ascii(Bin, []).

extract_ascii(<<>>, Acc) ->
    lists:reverse(Acc);
extract_ascii(<<C:8, Rest/binary>>, Acc) when C >= 32, C =< 126 ->
    extract_ascii(Rest, [C | Acc]);
extract_ascii(<<_:8, Rest/binary>>, Acc) ->
    extract_ascii(Rest, Acc).
