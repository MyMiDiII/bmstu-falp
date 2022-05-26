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

  emplMaxRat(empls, lastname).
  emplMaxRat(empls, rating, lastname, lastname).

  delMaxRat(empls, lastname, empls).
  delMaxRat(empls, lastname, integer, empls, empls).

  maxSal(sals, salary).
  maxSal(sals, salary, salary).

  delMaxSal(sals, salary, sals).
  delMaxSal(sals, salary, integer, sals, sals).

clauses
  emplMaxRat([], _, Res, Res).
  emplMaxRat([empl(Ln, R, _)|T], Rat, _, Res) :-
    R > Rat, 
    emplMaxRat(T, R, Ln, Res), !.
  emplMaxRat([_|T], Rat, CurRes, Res) :-
    emplMaxRat(T, Rat, CurRes, Res).

  emplMaxRat(Empls, Ln) :-
    emplMaxRat(Empls, 0, "", Ln).

  delMaxRat([], _, _, Res, Res).
  delMaxRat([empl(L, _, _)|T], L, 0, CurRes, Res) :-
    delMaxRat(T, L, 1, CurRes, Res), !.
  delMaxRat([H|T], L, Found, CurRes, Res) :-
    delMaxRat(T, L, Found, [H|CurRes], Res).

  delMaxRat(Rats, Sl, Res) :-
    delMaxRat(Rats, Sl, 0, [], Res).

  maxSal([], Res, Res).
  maxSal([sal(S, _)|T], MaxSal, Res) :-
    S > MaxSal, 
    maxSal(T, S, Res), !.
  maxSal([_|T], MaxSal, Res) :-
    maxSal(T, MaxSal, Res).

  maxSal(Sals, Res) :-
    maxSal(Sals, 0, Res).

  delMaxSal([], _, _, Res, Res).
  delMaxSal([sal(Sl, Num)|T], Sl, 0, CurRes, Res) :-
    NewNum = Num - 1,
    NewNum > 0,
    delMaxSal(T, Sl, 1, [sal(Sl, NewNum)|CurRes], Res), !.
  delMaxSal([sal(Sl, 1)|T], Sl, 0, CurRes, Res) :-
    delMaxSal(T, Sl, 1, CurRes, Res), !.
  delMaxSal([H|T], Sl, Found, CurRes, Res) :-
    delMaxSal(T, Sl, Found, [H|CurRes], Res).

  delMaxSal(Sals, Sl, Res) :-
    delMaxSal(Sals, Sl, 0, [], Res).

  paid([], _, Res, Res) :- !.
  paid([empl(Ln, _, _)|T], [], CurRes, Res) :-
    paid(T, [], [res(Ln, 0)|CurRes], Res), !.
  paid(Empls, Sals, CurRes, Res) :-
    emplMaxRat(Empls, Ln),
    delMaxRat(Empls, Ln, NewEmpls),
    maxSal(Sals, Sl),
    delMaxSal(Sals, Sl, NewSals),
    paid(NewEmpls, NewSals, [res(Ln, Sl)|CurRes], Res).

  paid(Empls, Sals, Res) :-
    paid(Empls, Sals, [], Res).

goal
  % Test search employee with max rating
  % emplMaxRat([], Res). % Res=
  % emplMaxRat([empl("A", 2, "1"),
  %              empl("B", 3, "3"),
  %              empl("C", 1, "2")], Res). % Res=B

  % Test delete max rating
  % delMaxRat([], "j", Res). % Res=[]
  % delMaxRat([empl("A", 2, "1"),
  %            empl("B", 3, "3"),
  %            empl("C", 1, "3")], "B", Res). % Res = [empl("C", 1, "3"),
  %                                                    empl("A", 2, "1")]
  % delMaxRat([empl("C", 1, "3"),
  %            empl("A", 2, "1")], "A", Res). % Res = [empl("C", 1, "3")]
  % delMaxRat([empl("C", 1, "3")], "C", Res). % Res = []

  % Test search max salary
  % maxSal([], Res). % Res = 0
  % maxSal([sal(15, 2), 
  %         sal(10, 3)], Res). % Res=15

  % Test delete max salary
  % delMaxSal([], 0, Res). % Res=[]
  % delMaxSal([sal(15, 2), 
  %            sal(10, 3)], 15, Res). % Res = [sal(10, 3), sal(15, 1)]
  % delMaxSal([sal(10, 3), 
  %            sal(15, 1)], 15, Res). % Res = [sal(10, 3)]
  % delMaxSal([sal(10, 3)], 10, Res). % Res = [sal(10, 2)]
  % delMaxSal([sal(10, 1)], 10, Res). % Res = []

  % Test full program
  paid([empl("A", 2, "1"),
        empl("B", 3, "3"),
        empl("C", 1, "3")],
       [sal(15, 2), 
        sal(10, 0)], Res).
  % Res=
  % [res("C", 10),
  %  res("A", 15),
  %  res("B", 15)]
