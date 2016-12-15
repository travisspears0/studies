-module(searchl).
-compile([export_all]).

search(L,S) -> search(L,S,0).
search([],_,_) -> [];
search([H|T],S,I) ->
	if H/=S ->
		[H]++search(T,S,I+1);
	true ->
		throw({S,I})
	end.

%L - list, S - search value
main(L,S) -> 
	try search(L,S) of
		X -> {S,'not found in',X}
	catch
		throw:{X,I} -> {'value',X,'found on position',I}
	end.
