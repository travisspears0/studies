-module(zadanie4).
-compile([export_all]).

proc() -> 
	receive
		{signal,[H]} -> H!{signal};
		{signal,[H|T]} -> 
			io:format("received signal ~p~n",[self()]),
			H!{signal,T}
	end.

% C - processes to be create
% R - signals to be received
main() -> main(100,[self()]).
main(0,[H|T]) -> 
	H!{signal,T},
	receive
		{signal} -> io:format("received in main, over~n",[])
	end;
main(C,L) -> 
	PID = spawn(zadanie4,proc,[]),
	main(C-1,[PID]++L).

