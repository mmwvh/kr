kansSpect(List, Prob) :-
	sum_list(List, Sum),
	length(List, Length),
	Prob is Sum/Length.
