-record(address, {
    street :: string(),
    city   :: string(),
    zip    :: string()
}).

-record(phone, {
    type  :: home | mobile | work,
    value :: string()
}).

-record(user, {
    id      :: integer(),
    name    :: string(),
    address :: #address{},
    phones  :: [#phone{}]
}).

-record(account, {
    number  :: integer(),
    user    :: #user{},
    balance :: float()
}).
