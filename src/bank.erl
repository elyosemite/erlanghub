-module(bank).
-export([
    new_user/4,
    new_account/2,
    deposit/2,
    withdraw/2,
    get_balance/1
]).

-include("bank.hrl").

%%% Types (Dialyzer)[
-type address()  :: #address{}.
-type phone()    :: #phone{}.
-type user()     :: #user{}.
-type account()  :: #account{}.
-type money()    :: float().

-spec new_user(integer(), string(), address(), [phone()]) -> user().
new_user(Id, Name, Address, Phones) ->
    #user{id=Id, name=Name, address=Address, phones=Phones}.

-spec new_account(integer(), user()) -> account().
new_account(Number, User) ->
    #account{number=Number, user=User, balance=0.0}.

-spec deposit(account(), money()) -> account().
deposit(Acc = #account{balance=Bal}, Amount) when Amount > 0 ->
    Acc#account{balance = Bal + Amount}.

-spec withdraw(account(), money()) -> {ok, account()} | {error, insufficient_funds}.
withdraw(Acc = #account{balance=Bal}, Amount) when Amount > 0 ->
    case Bal >= Amount of
        true -> {ok, Acc#account{balance = Bal - Amount}};
        false -> {error, insufficient_funds}
    end.

-spec get_balance(account()) -> money().
get_balance(#account{balance=Bal}) ->
    Bal.