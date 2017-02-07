-module(error_handling).
-compile([export_all]).

-define(MIN,3).

f(N) when N>0 -> N*3;
f(_) -> throw(err).

main(N) -> main(N,?MIN).
main(_,0) -> ok;
main(N,C) ->
	try f(N) of
		_ -> io:format("main ~p~n",[f(N)]), main(N-1,C-1)
	catch _ -> {error,"N must be greater or equal",?MIN}
	end.
