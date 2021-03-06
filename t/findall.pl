% Tests for findall/3
%
% findall/3 is defined in ISO §8.10.1
:- use_module(library(tap)).

% Tests derived from examples in ISO §8.10.1.4
disj :-
    findall(X, (X=1;X=2), S),
    S = [1,2].
template :-
    findall(X+_, (X=1), S),
    S = [1+_].
empty :-
    findall(_, fail, L),
    L = [].
duplicate :-
    findall(X, (X=1;X=1), S),
    S = [1, 1].
order(fail) :-
    findall(X, (X=2; X=1), [1,2]).

'variable instances (same names)' :-
    findall(X, (X=1; X=2), [X,Y]),
    X = 1, Y = 2 .

'variables instances (different names)' :-
    findall(X, (X=1; X=2), [A,B]),
    A = 1, B = 2 .

%all_variables(throws(instantiation_error)) :-
%    findall(X, Goal, S).
%type_error(throws(type_error(callable, 4)) :-
%    findall(X, 4, S).


% Tests derived from Prolog: The Standard p. 89
variables_in_goal :-
    findall(X, (X=Y; X=Y), S),
    S = [_,_].

% choice points before findall/3 don't change the results
'choicepoints before findall/3' :-
	( findall(x,fail,Result), !
	; true
	),
	Result = [].
