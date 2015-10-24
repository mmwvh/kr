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

primitive_action(move(_,_,_)).
primitive_action(push(_,_,_,_,_,_)).



% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S

poss(push(A,C,Loc,Loc2,Loc3,Dir), S) :-
	agent(A),
	crate(C),
	on(A, Loc, S),
	connect(Loc, Loc2,Dir),
	on(C, Loc2, S),
	connect(Loc2, Loc3,Dir),
	clear(Loc3, S).

poss(move(A, Loc, Loc2),S) :-
	agent(A),
	on(A, Loc, S),
	connect(Loc, Loc2, _),
	clear(Loc2, S).



% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan.

on(Object, Loc, result(A,S)) :-
	A = move(Object,_,Loc); 	%Object = Agent
	A = push(_,Object,_,_,Loc,_);	%Object is crate which is being pushed
	A = push(Object,_,_,Loc,_,_); 	%Object is Agent that is pushing
	on(Object, Loc, S), not(A = move(Object,Loc,_)), not(A = push(Object,_,Loc,_,_,_)), not(A = push(_,Object,_,Loc,_,_)).	%Object does not move.

clear(Loc, result(A,S)):-
	A = move(_,Loc,_); %Object = agent
	A = push(_,_,Loc,_,_,_);
	clear(Loc, S), not(A = move(_,_,Loc)), not(A = push(_,_,_,_,Loc,_)).



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
