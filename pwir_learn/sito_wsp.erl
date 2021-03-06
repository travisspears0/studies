-module(sito_wsp).
-compile([export_all]).

setnth(L,N,X) ->
	io:format("set ~p to ~p~n",[N,X]),
	lists:sublist(L,N-1) ++ [X] ++ lists:nthtail(N,L).

cross(PID,LEN,NUM) -> cross(PID,LEN,NUM,NUM*2).
cross(PID,LEN,NUM,COUNT) -> 
	if
		COUNT<LEN -> 
			PID!{prime,COUNT},
			cross(PID,LEN,NUM,COUNT+NUM);
		true -> PID!{over}
	end.

set_primes(PID,L) -> set_primes(PID,L,(length(L) div 2)-1).
%set_primes(PID,L,0) -> io:format("over setting primes~n",[]),PID!{L};
set_primes(PID,L,COUNT) ->
	receive
		{prime,X} -> %setnth(L,X,0),set_primes(PID,L,COUNT-1);
		if
			
		end,
		{over} -> io:format("over received ~p~n",[COUNT])
	end.

main(N) -> 
	SPPID = spawn(sito_wsp,set_primes,[self(),lists:seq(1,N)]),
	spawn(sito_wsp,spwn,[SPPID,N,1]),
	receive
		{L} -> L
	end.

spwn(SPPID,LEN,N) -> 
	%io:format("~p < ~p~n",[N,(LEN div 2)]),
	if
		N < (LEN div 2) -> 
			spawn(sito_wsp,cross,[SPPID,LEN,N]),
			spwn(SPPID,LEN,N+1);
		true -> 0
	end.


