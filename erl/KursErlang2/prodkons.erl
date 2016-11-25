-module(prodkons).
-compile([export_all]).

%posrednik z iloscia produktow
pos(N) ->
	io:format("posrednik ~p~n",[N]),
	receive
		{X} -> pos(N+X)
	end.

%L - limit, C-counter
prod(_,C,L) when C>L -> {limit_reached};
prod(POSID,C,L) when C=<L ->
	POSID!{1},
	timer:sleep(200),
	prod(POSID,C+1,L).

kons(_,C,L) when C>L -> {limit_reached};
kons(POSID,C,L) when C=<L ->
        POSID!{-1},
        timer:sleep(400),
        kons(POSID,C+1,L).

main() -> 
	POSID = spawn(prodkons,pos,[0]),
	spawn(prodkons,prod,[POSID,0,5]),
	spawn(prodkons,kons,[POSID,0,5])
.
