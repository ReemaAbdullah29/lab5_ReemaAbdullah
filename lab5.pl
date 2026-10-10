male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(selma, ling).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).

parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).


mother(X,Y):-
    parent(X,Y),
    female(X).

daughter(X,Y):-
    parent(Y,X),
    female(X).

sister(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    female(X),
    X \= Y.

father(X,Y):-
    parent(X,Y),
    male(X).

son(X,Y):-
    parent(Y,X),
    male(X).

brother(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    male(X),
    X \= Y.


grandfather(X,Y):-
    parent(X,Z),
    parent(Z,Y),
    male(X).

aunt(X,Z):-
    sister(X,Y),
    parent(Y,Z).

uncle(X,Z):-
    brother(X,Y),
    parent(Y,Z).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X \= Y.

cousin(X,Y):-
    parent(F,X),
    parent(S,Y),
    sibling(F,S).

ancestor(X,Z):-
    parent(X,Z).

ancestor(X,Z):-
    parent(X,Y),
    ancestor(Y,Z).
