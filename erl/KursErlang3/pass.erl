-module(pass).
-compile([export_all]).

len([_|T]) -> 1+len(T);
len([]) -> 0.

%ilosc el do odebrania N
receiver(0,L) -> io:format("receiver over with list ~p~n",[L]), L;
receiver(N,L) ->
	receive
		{EL}->
			io:format("received ~p~n",[EL]),
			receiver(N-1,L++[EL])
	end.

parser(RPID,EL) ->
	io:format("~p parrsing ~p~n",[self(),EL]),
	%EL = EL+1,
	%io:format(" into ~p~n",[EL]),
	RPID!{EL+1}.

%przyjmuje liste
start(L) -> 
	RPID = spawn(pass,receiver,[len(L),[]]),
	start(L,RPID).
start([H|T],RPID) ->
	spawn(pass,parser,[RPID,H]),
	start(T,RPID);
start([],_) -> ok.%io:format("",[]).
