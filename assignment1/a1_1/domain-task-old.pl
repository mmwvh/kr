% ------------------------- Domain Definition -------------------------
% This file describes a planning domain: a set of predicates and
% fluents that describe the state of the system, a set of actions and
% the axioms related to them. More than one problem can use the same
% domain definition, and therefore include this file


% --- Cross-file definitions ------------------------------------------
% marks the predicates whose definition is spread across two or more
% files

:- multifile on/3, clear/2.



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

poss(push(X,C,Direction), S) :-
	agent(X),
	crate(C),
	on(X, Loc, S),
	connect(Loc, Loc2, Direction),
	on(C, Loc2, S),
	connect(Loc2, Loc3, Direction),
	clear(Loc3, S).
poss(move(X, Direction),S) :-
	agent(X),
	on(X, Loc, S),
	connect(Loc, Loc2, Direction),
	clear(Loc2, S).


% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan.
%
% fluent(..., result(A,S)) :- positive; previous-state, not(negative).

on(Object, Loc, result(A,S)) :-
	A = move(Object, Direction), on(Object, Loc_i, S), connect(Loc_i,Loc, Direction); % Object = Agent
	A = push(_,Object,Direction), on(Object, Loc1, S), connect(Loc1, Loc, Direction);%Object is crate which is being pushed
	A = push(Object,_, Direction), on(Object, Loc_i, S), connect(Loc_i,Loc, Direction); %Object is Agent that is pushing
	on(Object, Loc, S), not(A= move(Object, _)), not(A = push(Object,_,_)), not(A = push(_,Object,_)).%Object does not move.

clear(Loc, result(A,S)):-
	A = move(Object,_), on(Object, Loc, S); %Object = agent
	A = push(Object,_,_), on(Object, Loc, S); %Object = agent
	clear(Loc, S), on(Object, Loc_i,S),(connect(Loc_i, Loc, Direction), not(A = move(Object, Direction)), not(A = push(_,Object, Direction)) ; not(connect(Loc_i, Loc, _))).



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------


