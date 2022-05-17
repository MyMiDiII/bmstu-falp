/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB14
 FileName: LAB14.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  name = string.
  sex  = string.

predicates
  parent(sex, name, name).
  grandParent(sex, sex, name, name).

clauses
  parent("w", "Irina",     "Marina").
  parent("m", "Dmitry",    "Marina").
  parent("w", "Valentina", "Irina").
  parent("m", "Nikolay",   "Irina").
  parent("w", "Zoya",      "Dmitry").
  parent("m", "Victor",    "Dmitry").

  grandParent(Side, Sex, GrandParent, Child) :-
    parent(Side, Parent, Child),
    parent(Sex,  GrandParent, Parent).

goal
  % 1
  % grandParent(_, "w", GrandParent, "Marina").

  % 2
  % grandParent(_, "m", GrandParent, "Marina").

  % 3
  % grandParent(_, _, GrandParent, "Marina").

  % 4
  % grandParent("w", "w", GrandParent, "Marina").

  % 5
  grandParent("w", _, GrandParent, "Marina").
