-module(pidy).
-compile([export_all]).


bigg(MPID,N) -> 
	receive
		{1} -> bigg(MPID,N+1);
% io:format("big poppa!~n",[]),bigg(MPID);
		{over} -> MPID!{bg,N},over
%io:format("over bigg ~p~n",[N]),over
	end.
smal(MPID,N) ->
	receive
		{1} -> smal(MPID,N+1);
% io:format("small blind!~n",[]),smal(MPID);
		{over} -> MPID!{sm,N},over
%io:format("over smal ~p~n",[N]),over
	end.

gen(SPID,BPID,[]) -> 
	SPID!{over}, 
	BPID!{over},
	[];
gen(SPID,BPID,[H|T]) -> 
	if 
		H > 5 -> BPID!{1};
		true -> SPID!{1}
	end,
	gen(SPID,BPID,T).
%%%
main() -> main(3).
main(N) -> 
	MPID = spawn(pidy,main_get,[2]),
	BPID = spawn(pidy,bigg,[MPID,0]),
	SPID = spawn(pidy,smal,[MPID,0]),
	spawn(pidy,gen,[SPID,BPID,[rand:uniform(10)||_ <- lists:seq(1,N)]]).

main_get(0) -> 0;
main_get(N) ->
	receive
		{sm,X} -> io:format("small numbers: ~p~n",[X]),main_get(N-1);
		{bg,X} -> io:format("big numbers: ~p~n",[X]),main_get(N-1)
	end.



