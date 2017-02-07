-module(zadc).
-compile([export_all]).

p() ->
	receive
		{pa} -> io:format("moj pid: ~p~n",[self()])
	end.

main() -> main(100,[]).
main(0,L) -> snd(L);
main(N,L) -> 
	PID = spawn(zadc,p,[]),
	main(N-1,L++[PID]).

snd([]) -> ok;
snd([H|T]) -> H!{pa},
	snd(T).
