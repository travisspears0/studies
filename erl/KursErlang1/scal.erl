-module(scal).
-compile([export_all]).

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

