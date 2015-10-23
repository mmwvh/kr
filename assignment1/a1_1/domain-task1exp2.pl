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
primitive_action(move(_,_,_,_) ).	% underscore means `anything'
primitive_action(push(_,_,_,_,_,_)).






% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S
%
% poss( doSomething(...), S ) :- preconditions(..., S).

poss(push(A,C,Loc,Loc2,Loc3,Direction), S) :-
	agent(A),
	crate(C),
	on(A, Loc, S),
	connect(Loc, Loc2, Direction),
	on(C, Loc2, S),
	connect(Loc2, Loc3, Direction),
	clear(Loc3, S).
poss(move(X, Loc, Loc2, Direction),S) :-
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
	A = move(Object,_,Loc, Direction); % Object = Agent
	A = push(_,Object,_,_,Loc,Direction);%Object is crate which is being pushed
	A = push(Object,_,_,Loc,_,Direction); %Object is Agent that is pushing
	on(Object, Loc, S), not(A= move(Object,_,_,_)), not(A = push(Object,_,_,_,_,_)), not(A = push(_,Object,_,_,_,_)).%Object does not move.

clear(Loc, result(A,S)):-
	A = move(Object,Loc,_,_); %Object = agent
	A = push(Object,_,Loc,_,_,_); %Object = agent
	clear(Loc, S), not(A= move(Agent,_,Loc,_)), .



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------


