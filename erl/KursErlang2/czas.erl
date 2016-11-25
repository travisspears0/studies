-module(czas).
-compile([export_all]).

get_time() ->
  {Mega, Sec, Micro} = os:timestamp(),
  (Mega*1000000 + Sec)*1000 + round(Micro/1000).

fib(N) when N=<1 -> N;
fib(N) when N>1 -> fib(N-1)+fib(N-2).

main() ->
	TP = get_time(),
	%io:format("~p~n",[fib(5)]),
	F=fib(35),
	TK = get_time()-TP,
	io:format("wynik: ~p~nczas obliczen: ~pms ~n", [F,TK]).
