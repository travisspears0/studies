-module(sito).
-compile([export_all]).

sito([]) -> ;
sito([H|T]) ->
	.

main(N) -> sito(lists:seq(1,N)).
