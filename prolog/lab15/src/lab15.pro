/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB15
 FileName: LAB15.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  num = integer.

predicates
  max(num, num, num).
  catMax(num, num, num).
  max(num, num, num, num).
  catMax(num, num, num, num).

clauses
  max(Num1, Num2, Num1) :-
    Num1 >= Num2. 
  max(Num1, Num2, Num2) :-
    Num1 < Num2.

  catMax(Num1, Num2, Num1) :-
    Num1 >= Num2, !.
  catMax(_, Num2, Num2).

  max(Num1, Num2, Num3, Num1) :-
    Num1 >= Num2, Num1 >= Num3. 
  max(Num1, Num2, Num3, Num2) :-
    Num2 > Num1, Num2 >= Num3. 
  max(Num1, Num2, Num3, Num3) :-
    Num3 > Num1, Num3 > Num2. 

  catMax(Num1, Num2, Num3, Num1) :-
    Num1 >= Num2, Num1 >= Num3, !. 
  catMax(_, Num2, Num3, Num2) :-
    Num2 >= Num3, !.
  catMax(_, _, Num3, Num3).

goal
  % 1.a
  % max(5, 5, Max).
  % max(5, 6, Max).
  % max(-5, -6, Max).

  % 1.b
  % catMax(5, 5, Max).
  % catMax(5, 6, Max).
  % catMax(-5, -6, Max).

  % 2.a
  % max( 5,  5,  5, Max).
  % max( 5,  6,  6, Max).
  % max( 6,  5,  6, Max).
  % max( 6,  6,  5, Max).
  % max( 7,  6,  6, Max).
  % max( 6,  7,  6, Max).
  % max( 6,  6,  7, Max).
  % max(-1, -2, -3, Max).
  % max(-2, -1, -3, Max).
  % max(-3, -2, -1, Max).

  % 2.b
  % catMax( 5,  5,  5, Max).
  % catMax( 5,  6,  6, Max).
  % catMax( 6,  5,  6, Max).
  % catMax( 6,  6,  5, Max).
  % catMax( 7,  6,  6, Max).
  % catMax( 6,  7,  6, Max).
  % catMax( 6,  6,  7, Max).
  % catMax(-1, -2, -3, Max).
  % catMax(-2, -1, -3, Max).
  catMax(-3, -2, -1, Max).

