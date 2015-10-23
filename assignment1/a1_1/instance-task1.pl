% ------------------------- Problem Instance --------------------------
% This file is a template for a problem instance: the definition of an
% initial state and of a goal.

%debug(on).	% need additional debug information at runtime?



% --- Load domain definitions from an external file -------------------

:- ['domain-task1'].		% Replace with the domain for this problem




% --- Definition of the initial state ---------------------------------

connect(loc1-1, loc1-2, n).
connect(loc1-2, loc1-1, s).
connect(loc1-2, loc1-3, n).
connect(loc1-3, loc1-2, s).
connect(loc1-3, loc1-4, n).
connect(loc1-4, loc1-3, s).

connect(loc2-1, loc2-2, n).
connect(loc2-2, loc2-1, s).
connect(loc2-2, loc2-3, n).
connect(loc2-3, loc2-2, s).
connect(loc2-3, loc2-4, n).
connect(loc2-4, loc2-3, s).

connect(loc3-1, loc3-2, n).
connect(loc3-2, loc3-1, s).
connect(loc3-2, loc3-3, n).
connect(loc3-3, loc3-2, s).

connect(loc1-1, loc2-1, e).
connect(loc2-1, loc1-1, w).
connect(loc2-1, loc3-1, e).
connect(loc3-1, loc2-1, w).
connect(loc1-2, loc2-2, e).
connect(loc2-2, loc1-2, w).
connect(loc2-2, loc3-2, e).
connect(loc3-2, loc2-2, w).
connect(loc1-3, loc2-3, e).
connect(loc2-3, loc1-3, w).
connect(loc2-3, loc3-3, e).
connect(loc3-3, loc2-3, w).
connect(loc1-4, loc2-4, e).
connect(loc2-4, loc1-4, w).

clear(loc1-1, s0).
clear(loc1-2, s0).
clear(loc1-3, s0).
clear(loc1-4, s0).
clear(loc2-4, s0).
clear(loc3-1, s0).
clear(loc3-3, s0).

crate(blockA).
crate(blockB).
crate(blockC).
on(blockA, loc2-3, s0).
on(blockB, loc2-2, s0).
on(blockC, loc2-1, s0).
agent(a).
on(a, loc3-2, s0).


% --- Goal condition that the planner will try to reach ---------------

goal(S) :- on(blockA, loc1-2, S).					% fill in the goal definition




% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
