-module(zadb).
-compile([export_all]).

skroc([]) -> [];
skroc([_]) -> [];
skroc([A,B|T]) -> [(A+B)/2 | skroc(T)].

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1)+fib(N-2).

fibi(N) -> fibi(N-1,0,1).
fibi(0,_,A) -> A;
fibi(N,A,B) -> fibi(N-1,B,A+B).

proc() -> timer:sleep(1000),
	receive
		{asd} -> io:format("received asd",[])
	end,
	io:format("over proc",[]).

empty() -> PID = spawn(zadb,proc,[]),
	PID!{asd}.
