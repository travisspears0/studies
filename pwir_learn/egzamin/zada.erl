-module(zada).
-compile([export_all]).

pa() ->
	io:format("a sending x~n",[]),
	whereis(b)!{x},
	receive
		{x} -> 
			timer:sleep(1000),
			pa()
	after 500 ->
			whereis(c)!{e},
			whereis(b)!{e}
	end,
	receive
		{e}->exit(over)
	end.
pb() -> 
	receive
		{x} -> 
			io:format("b received & sending x~n",[]),
			whereis(c)!{x},
			pb();
		{e} -> exit(over)
	end.
pc(N) -> 
	receive
		{x} -> 	
			io:format("c ~p received & sending x~n",[N]),
			timer:sleep(N),
			whereis(a)!{x},
			pc(N+100);
		{e} -> exit(over),whereis(a)!{e}
	end.

main() ->
	PIDA = spawn(zada,pa,[]),
	PIDB = spawn(zada,pb,[]),
	PIDC = spawn(zada,pc,[100]),
	register(a,PIDA),
	register(b,PIDB),
	register(c,PIDC).



