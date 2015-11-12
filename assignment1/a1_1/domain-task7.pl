% ------------------------- Domain Definition -------------------------
% This file describes a planning domain: a set of predicates and
% fluents that describe the state of the system, a set of actions and
% the axioms related to them. More than one problem can use the same
% domain definition, and therefore include this file


% --- Cross-file definitions ------------------------------------------
% marks the predicates whose definition is spread across two or more
% files

:- multifile on/3, clear/2, hasKey/3.



% --- Primitive control actions ---------------------------------------
% this section defines the name and the number of parameters of the
% actions available to the planner

primitive_action(move(_,_,_)).
primitive_action(push(_,_,_,_,_,_)).
primitive_action(pickUpKey(_,_,_,_)).



% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S

poss(push(A,C,Loc,Loc2,Loc3,Dir), S) :-
	agent(A),
	crate(C),
	rightKey(K, C),
	hasKey(A, K, S),
	on(A, Loc, S),
	connect(Loc, Loc2, Dir),
	on(C, Loc2, S),
	connect(Loc2, Loc3, Dir),
	clear(Loc3, S).

poss(move(A, Loc, Loc2),S) :-
	agent(A),
	on(A, Loc, S),
	connect(Loc, Loc2,_),
	clear(Loc2, S).

poss(pickUpKey(A,K,Loc,Loc2), S) :-
	agent(A),
	key(K),
	on(A, Loc, S),
	connect(Loc, Loc2,_),
	on(K, Loc2, S).



% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan.

on(Object, Loc, result(A,S)) :-
	A = move(Object,_,Loc);		%Object is Agent
	A = push(_,Object,_,_,Loc,_);	%Object is crate which is being pushed
	A = push(Object,_,_,Loc,_,_);	%Object is Agent that is pushing
	A = pickUpKey(Object,_,_,Loc);	%Object is Agent that takes step and takes key
	on(Object, Loc, S), not(A = move(Object, Loc,_)), not(A = push(Object,_,Loc,_,_,_)), not(A = push(_,Object,_,Loc,_,_)),not(A = pickUpKey(Object,_,Loc,_)), not(A = pickUpKey(_,Object,_,Loc)).	%Object does not move.

clear(Loc, result(A,S)):-
	A = move(_,Loc,_);	A = push(_,_,Loc,_,_,_);
	A = pickUpKey(_,_,Loc,_);
	clear(Loc, S), not(A = move(_,_,Loc)), not(A = push(_,_,_,_,Loc,_)).

hasKey(Agent,Key, result(A,S)):-
	A = pickUpKey(Agent, Key,_,_);
	hasKey(Agent, Key, S).



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
