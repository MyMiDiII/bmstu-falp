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

  emplMaxRate(empls, lastname).
  emplMaxRate(empls, rating, lastname, lastname).

  maxSal(sals, salary).
  maxSal(sals, salary, salary).

clauses
  emplMaxRate([], _, Res, Res).
  emplMaxRate([empl(Ln, R, _)|T], Rat, _, Res) :-
    R > Rat, 
    emplMaxRate(T, R, Ln, Res), !.
  emplMaxRate([_|T], Rat, CurRes, Res) :-
    emplMaxRate(T, Rat, CurRes, Res).

  emplMaxRate(Empls, Ln) :-
    emplMaxRate(Empls, 0, "", Ln).

  maxSal([], Res, Res).
  maxSal([sal(S, _)|T], MaxSal, Res) :-
    S > MaxSal, 
    maxSal(T, S, Res), !.
  maxSal([_|T], MaxSal, Res) :-
    maxSal(T, MaxSal, Res).

  maxSal(Sals, Res) :-
    maxSal(Sals, 0, Res).

  paid([], _, Res, Res) :- !.
  paid([empl(Ln, _, _)|T], [], CurRes, Res) :-
    paid(T, [], [res(Ln, 0)|CurRes], Res).
  paid([He|Te], [Hs|Ts], CurRes, Res) :-
    emplMaxRate([He|Te], Ln),
    %delMaxRate(Empls, Ln, NewEmpls),
    maxSal([Hs|Ts], Sl),
    %delMaxSal(Sasl, Sl, NewSals),
    paid(Te, Ts, [res(Ln, Sl)|CurRes], Res).

  paid(Empls, Sals, Res) :-
    paid(Empls, Sals, [], Res).

goal
  % Test search employee with max rating
  % emplMaxRate([], Res). % Res=
  % emplMaxRate([empl("A", 2, "1"),
  %              empl("B", 3, "3"),
  %              empl("C", 1, "2")], Res). % Res=B

  % Test search max salary
  % maxSal([], Res). % Res = 0
  % maxSal([sal(15, 2), 
  %         sal(10, 3)], Res). % Res=15

  % Test full program
  paid([empl("A", 3, "1"),
        empl("B", 2, "3"),
        empl("C", 1, "3")],
       [sal(15, 1), 
        sal(10, 1)], Res).
