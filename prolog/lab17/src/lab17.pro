/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB17
 FileName: LAB17.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  list = integer*.

predicates
  len(list, integer, integer).
  len(list, integer).

  sum(list, integer, integer).
  sum(list, integer).

  oddSum(list, integer, integer).
  oddSum(list, integer).

clauses
  len([], Res, Res).
  len([_|T], CurRes, Res) :-
    NewRes = CurRes + 1,
    len(T, NewRes, Res).

  len(List, Res) :-
    len(List, 0, Res).

  sum([], Res, Res).
  sum([H|T], CurRes, Res) :-
    NewRes = CurRes + H,
    sum(T, NewRes, Res).

  sum(List, Res) :-
    sum(List, 0, Res).

  oddSum([], Res, Res).
  oddSum([_], Res, Res).
  oddSum([_, Y|T], CurRes, Res) :-
    NewRes = CurRes + Y,
    oddSum(T, NewRes, Res).

  oddSum(List, Res) :-
    oddSum(List, 0, Res).

goal
  % 1
  % len([], Res).
  % len([1], Res).
  % len([3, 2, 1], Res).

  % 2
  % sum([], Res).
  % sum([-10], Res).
  % sum([4, -10, 10, -5], Res).

  % 3
  % oddSum([], Res).
  % oddSum([-10], Res).
  % oddSum([-10, 4], Res).
  % oddSum([4, -10, 10], Res).
  oddSum([4, -10, 10, -5], Res).
