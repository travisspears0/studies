-module(communication).
-compile([export_all]).

dealer([A]) ->
	timer:sleep(350),
	A!{ok};
dealer([A|T]) ->
	timer:sleep(350),
	A!{ok},
	dealer(T).

client() ->
	receive
		{X} -> io:format("~p~n",[X]),X
	end.

main(N) -> main(N,[]).
main(0,L) -> spawn(communication,dealer,[L]);
main(N,L) ->
	PID = spawn(communication,client,[]),
	main(N-1,[PID]++L).
