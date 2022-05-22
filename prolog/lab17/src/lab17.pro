/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB17
 FileName: LAB17.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  elems = l(list); i(integer).
  list = elems*.

predicates
  len(list, integer, integer).
  len(list, integer).

clauses
  len([], Res, Res) :- !.
  len([_|T], CurRes, Res) :-
    NewRes = CurRes + 1,
    len(T, NewRes, Res).

  len(List, Res) :-
    len(List, 0, Res).

goal
  % 1
  % len([], Res).
  % len([1], Res).
  len([l([i(3), i(2), i(1)]), i(1)], Res).
