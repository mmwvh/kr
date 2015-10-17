% ------------------------- Domain Definition -------------------------
% This file describes a planning domain: a set of predicates and
% fluents that describe the state of the system, a set of actions and
% the axioms related to them. More than one problem can use the same
% domain definition, and therefore include this file


% --- Cross-file definitions ------------------------------------------
% marks the predicates whose definition is spread across two or more
% files

:- multifile on/3, clear/2, connected/3, agent/1.



% --- Primitive control actions ---------------------------------------
% this section defines the name and the number of parameters of the
% actions available to the planner
%
primitive_action(move(_,_) ).	% underscore means `anything'
primitive_action(push(_,_,_)).






% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S
%
% poss( doSomething(...), S ) :- preconditions(..., S).

poss(push(agent(X),Crate,Direction), S) :-
	on(agent(X), Loc, S),
	connected(Loc, Loc2, Direction),
	on(Crate, Loc2, S),
	connected(Loc2, Loc3, Direction),
	clear(Loc3, S).
poss(move(agent(X), Direction),S) :-
	on(agent(X), Loc, S),
	connected(Loc, Loc2, Direction),
	clear(Loc2, S).


% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan.
%
% fluent(..., result(A,S)) :- positive; previous-state, not(negative).

on(Object, Loc, result(A,S)) :-
	A = move(Object, Direction), on(Object, Loc_i, S), connected(Loc_i,Loc, Direction); % Agent doet stap
	A = push(_,Object,Direction), on(Object, Loc1, S), connected(Loc1, Loc, Direction);%Object is crate which is being pushed
	A = push(Object,_, Direction), on(Object, Loc_i, S), connected(Loc_i,Loc, Direction); %Object is Agent that is pushing
	on(Object, Loc, S), not(A= move(Object, _)), not(A = push(Object,_,_)), not(A = push(_,Object,_)).%Object is agent and does not move.

clear(Loc, result(A,S)):-
	A = move(Object,_), on(Object, Loc, S); %Object = agent
	A = push(Object,_,_), on(Object, Loc, S); %Object = agent
	clear(Loc, S), not(A = move(Object, Direction), on(Object, Loc_i, S), connected(Loc_i,Loc, Direction)), not(A = push(_, Object, Direction), on(Object, Loc_i, S), connected(Loc_i, Loc, Direction)).



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
