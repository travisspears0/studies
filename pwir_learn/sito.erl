-module(sito).
-compile([export_all]).

setnth(L,N,X) ->lists:sublist(L,N-1) ++ [X] ++ lists:nthtail(N,L).

sito(L) ->sito(L,2).
sito(L,X) -> 
	if
		X < length(L)/2 -> sito(cross(L,X),X+1);
		true -> L
	end.

cross(L,X) -> cross(L,X,X*2).
cross(L,X,C) -> 
	if
		C<length(L) -> cross(sito:setnth(L,C,0),X,C+X);
		true -> L
	end.

main(N) -> 
%sito([ || _ <- lists:seq(1,N)]).
sito(lists:seq(1,N)).
