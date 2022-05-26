/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB18
 FileName: LAB18.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  list = integer*

predicates
  onlyBigger(list, integer, list).
  onlyBigger(list, integer, list, list).

  onlyOdd(list, list, list).
  onlyOdd(list, list).

  deleteAllEl(list, integer, list).
  deleteAllEl(list, integer, list, list).

  deleteEl(list, integer, list).
  deleteEl(list, integer, integer, list, list).

  listToSet(list, list).
  listToSet(list, list, list).

clauses
  onlyBigger([], _, Res, Res).
  onlyBigger([H|T], Board, CurRes, Res) :-
    H <= Board, !,
    onlyBigger(T, Board, CurRes, Res).
  onlyBigger([H|T], Board, CurRes, Res) :-
    onlyBigger(T, Board, [H|CurRes], Res).

  onlyBigger(List, Board, Res) :-
    onlyBigger(List, Board, [], Res).

  onlyOdd([], Res, Res).
  onlyOdd([_], Res, Res).
  onlyOdd([_, Y|T], CurRes, Res) :-
    onlyOdd(T, [Y|CurRes], Res).

  onlyOdd(List, Res) :-
    onlyOdd(List, [], Res).

  deleteAllEl([], _, Res, Res).
  deleteAllEl([El|T], El, CurRes, Res) :-
    deleteAllEl(T, El, CurRes, Res), !.
  deleteAllEl([H|T], El, CurRes, Res) :-
    deleteAllEl(T, El, [H|CurRes], Res).

  deleteAllEl(List, El, Res) :-
    deleteAllEl(List, El, [], Res).

  deleteEl([], _, _, Res, Res).
  deleteEl([El|T], El, Found, CurRes, Res) :-
    Found = 0,
    deleteEl(T, El, 1, CurRes, Res), !.
  deleteEl([H|T], El, Found, CurRes, Res) :-
    deleteEl(T, El, Found, [H|CurRes], Res).

  deleteEl(List, El, Res) :-
    deleteEl(List, El, 0, [], Res).

  listToSet([], Res, Res).
  listToSet([H|T], CurRes, Res) :-
    deleteAllEl(T, H, Tail),
    listToSet(Tail, [H|CurRes], Res).

  listToSet(List, Res) :-
    listToSet(List, [], Res).

goal
  % 1
  % onlyBigger([], 0, Res).
  % onlyBigger([1], 0, Res).
  % onlyBigger([-5, 3, -3, 5, 0], -1, Res).
  % onlyBigger([-5, -3, 0], 0, Res).

  % 2
  % onlyOdd([], Res).
  % onlyOdd([-10], Res).
  % onlyOdd([-10, 4], Res).
  % onlyOdd([4, -10, 10], Res).
  % onlyOdd([4, -10, 10, -5], Res).

  % 3.1
  % deleteAllEl([], 0, Res).
  % deleteAllEl([1], 1, Res).
  % deleteAllEl([0], 1, Res).
  % deleteAllEl([1, 2, -3, 4], -3, Res).
  % deleteAllEl([1, -3, 1, -3, -3, 2], -3, Res).
  % deleteAllEl([-3, -3, -3], -3, Res).

  % 3.2
  % deleteEl([], 0, Res).
  % deleteEl([1], 1, Res).
  % deleteEl([0], 1, Res).
  % deleteEl([1, 2, -3, 4], -3, Res).
  % deleteEl([1, -3, 1, -3, -3, 2], -3, Res).
  % deleteEl([-3, -3, -3], -3, Res).

  % 4
  % listToSet([], Res).
  % listToSet([1], Res).
  % listToSet([1, 2, -3, 4], Res).
  % listToSet([1, -3, 1, -3, -3, 2], Res).
  listToSet([-3, -3, -3], Res).
