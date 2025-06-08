-module(my_first_records).
-export([new_person/3]).
-record(person, {name = "", phone = [], address = undefined}).

new_person(Name, Phone, Address) ->
	#person{name = Name, phone = Phone, address = Address}.
