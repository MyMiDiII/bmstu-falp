/*****************************************************************************

		Copyright (c) BMSTU

 Project:  RK
 FileName: RK.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  lastname, phone = string.
  rating, salary, num = integer.
  empl = empl(lastname, rating, phone).
  sal  = sal(salary, num).
  res  = res(lastname, salary).

  empls = empl*.
  sals  = sal*.
  resls = res*.

predicates
  paid(empls, sals, resls).
  paid(empls, sals, resls, resls).

clauses
  paid([], _, Res, Res) :- !.
  paid(_, [], Res, Res).
  paid([empl(Ln, _, _)|T], Sals, CurRes, Res) :-
    paid(T, Sals, [res(Ln, 0)|CurRes], Res).

  paid(Empls, Sals, Res) :-
    paid(Empls, Sals, [], Res).

goal
  paid([empl("A", 3, "1"),
        empl("B", 2, "3"),
        empl("C", 1, "3")],
       [sal(15, 2), 
        sal(10, 3)], Res).
