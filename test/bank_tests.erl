-module(bank_tests).
-include("../src/bank.hrl").
-include_lib("eunit/include/eunit.hrl").

new_user_test() ->
    Addr = #address{street="R1", city="SP", zip="00000"},
    Phone = #phone{type=mobile, value="99999"},
    User = bank:new_user(1, "João", Addr, [Phone]),
    ?assertEqual(1, User#user.id),
    ?assertEqual("João", User#user.name),
    ?assertEqual("SP", (User#user.address)#address.city).

new_account_test() ->
    Addr = #address{street="R1", city="SP", zip="00000"},
    User = bank:new_user(1, "João", Addr, []),
    Account = bank:new_account(1234, User),
    ?assertEqual(0.0, Account#account.balance).

deposit_test() ->
    Addr = #address{street="R1", city="SP", zip="00000"},
    User = bank:new_user(1, "João", Addr, []),
    Acc = bank:new_account(1234, User),
    Acc2 = bank:deposit(Acc, 500.0),
    ?assertEqual(500.0, bank:get_balance(Acc2)).

withdraw_test() ->
    Addr = #address{street="R1", city="SP", zip="00000"},
    User = bank:new_user(1, "João", Addr, []),
    Acc = bank:deposit(bank:new_account(1234, User), 500.0),
    {ok, Acc2} = bank:withdraw(Acc, 200.0),
    ?assertEqual(300.0, bank:get_balance(Acc2)),
    {error, insufficient_funds} = bank:withdraw(Acc2, 500.0).
