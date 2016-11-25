%  sort1.erl
-module(sort1).
-compile([export_all]).

get_mstimestamp() ->
  {Mega, Sec, Micro} = os:timestamp(),
  (Mega*1000000 + Sec)*1000 + round(Micro/1000).
  
%sortowanie babelkowe
sortbb(L) -> sortbb(L,[]).
sortbb([A,B|T],L) when A>B -> sortbb([B]++T,L++[A]);
sortbb([A,B|T],L) when A=<B -> sortbb([A]++T,L++[B]);
sortbb([A],L) -> L++[A].
%(sortbb:head(L,3)++lists:nthtail(3,L)==L)
sorts(L) -> sorts(L,length(L)).
sorts(L,0) -> L;
sorts(L,I) -> sorts(sortbb(L),I-1).
	
	
%%%%%%%%%
%self().

head(L,I) -> head(L,I,[]).
head(_,0,R) -> R;
head([H|T],I,R) -> head(T,I-1,R++[H]).

scal([]) -> [];
scal([A]) -> [A];
scal(L) -> scal(scal(head(L,length(L) div 2)),scal(lists:nthtail(length(L) div 2, L))).
scal([A|T1],[B|T2]) when A=<B -> [A]++scal(T1,[B]++T2);
scal([A|T1],[B|T2]) when A>B  -> [B]++scal([A]++T1,T2);
scal(L,[]) -> scal(L);
scal([],L) -> scal(L).

printarr([A]) -> io:format("~p~n", [A]);
printarr([H|T]) ->
	io:format("~p ",[H]),
	printarr(T).

%L-list,S-side
sortw(L) -> %sortw(L,self()).
	spawn(sort1,sortw,[L,self(),left]),
	receive
		{LIST} -> LIST
	end.
sortw([],PID,S) -> 
	PID!{[],S};
sortw([A],PID,S) -> 
	PID!{[A],S};
sortw(L,PID,S) -> 
	_ = printarr(L),
	spawn(sort1,sortw,[head(L,length(L) div 2),self(),left]),%lewa strona
	spawn(sort1,sortw,[lists:nthtail(length(L) div 2, L),self(),right]),%prawa strona
	LL = receive
		{L1,left} -> L1
	end,
	LR = receive
		{L2,right} -> L2
	end,
	PID!{LL+LR,S}. 

%sortw([A|T1],[B|T2],pid) -> pid. %when A=<B -> [A]++sortw(T1,[B]++T2);
%sortw([A|T1],[B|T2],pid) -> pid.%when A>B  -> [B]++sortw([A]++T1,T2);
%sortw(L,[]) -> sortw(L);
%sortw([],L) -> sortw(L).

gensort() ->
 L=[rand:uniform(5000)+100 || _ <- lists:seq(1, 10)],	
 Lw=L,
 io:format("Liczba elementów = ~p ~n",[length(L)]),
 
 io:format("Sortuję sekwencyjnie~n"),	
 TS1=get_mstimestamp(),
 sorts(L),
 DS=get_mstimestamp()-TS1,	
 io:format("Czas sortowania ~p [ms]~n",[DS]),
 io:format("Sortuję współbieżnie~n"),	
 TS2=get_mstimestamp(),
 sortw(Lw),
 DS2=get_mstimestamp()-TS2,	
 io:format("Czas sortowania ~p [ms]~n",[DS2]).
 
 
