-module(zadanie1).
-compile([export_all]).

waitforit() ->
	receive
		{msg} -> 
			%io:format("over ~p~n",[self()]),
			io:format(".",[]),
			ok
	end.

main() -> main(100,[]).
main(0,L) -> callem(L);
main(N,L) -> 
	PID = spawn(zadanie1,waitforit,[]),
	main(N-1,L++[PID]).

callem([]) -> done;
callem([H|T]) -> 
	%io:format("callin ~p~n",[H]),
	H!{msg},
	callem(T).
