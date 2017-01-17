-module(zadanie2).
-compile([export_all]).

proca(PIDB)->
	timer:sleep(1000),
	PIDB!{a,self()},
	receive
		{b} -> io:format("[A]got b~n",[]),
		proca(PIDB)
	after
		200 -> io:format("nothing~n",[])
	end.

procb(T)->
	receive
		{a,PIDA} -> 	io:format("[B]got a~n",[]),
				timer:sleep(T),
				PIDA!{b},
				procb(T+50)
	end.

main() -> 
	PIDB = spawn(zadanie2,procb,[100]),
	spawn(zadanie2,proca,[PIDB]).

%timer:sleep(500),10.
