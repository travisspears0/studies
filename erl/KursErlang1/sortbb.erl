-module(sortbb). 
-compile([export_all]).

head(L,I) -> head(L,I,[]).
head(_,0,R) -> R;
head([H|T],I,R) -> head(T,I-1,R++[H]).

%tail(L,N) -> ttail(L,len(L)-N-1).
%ttail([_|T],0) -> T;
%ttail([_|T],I) -> ttail(T,I-1).

%removes nth element from list
remove(L,N) -> remove(L,N,1,[]).
remove([_|T],N,C,R) when C==N -> remove(T,N,C+1,R);
remove([H|T],N,C,R) when C/=N -> remove(T,N,C+1,lists:append(R,[H]));
remove([],_,_,R) -> R.

swap(List,S1,S2) -> {List2,[F|List3]} = lists:split(S1-1,List),
   LT = List2++[lists:nth(S2,List)|List3],
   {List4,[_|List5]} = lists:split(S2-1,LT),
   List4++[F|List5].

%sortowanie babelkowe
sort(L) -> sort(L,[]).
sort([A,B|T],L) when A>B -> sort([B]++T,L++[A]);
sort([A,B|T],L) when A=<B -> sort([A]++T,L++[B]);
sort([A],L) -> L++[A].

%(sortbb:head(L,3)++lists:nthtail(3,L)==L)

srt(L) -> srt(L,length(L)).
srt(L,0) -> L;
srt(L,I) -> srt(sort(L),I-1).
